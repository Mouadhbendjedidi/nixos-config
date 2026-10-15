{ pkgs }:

let
  version = "2.8.2";

  # dlopen()ed at runtime, so autoPatchelf can't see them
  runtimeLibs = with pkgs; [
    icu openssl fontconfig libGL vulkan-loader
    libx11 libxcursor libxext libxi libxrandr libice libsm
  ];
in
pkgs.stdenv.mkDerivation {
  pname = "apps2samsung";
  inherit version;

  src = pkgs.fetchurl {
    url = "https://github.com/Apps2Samsung/Apps2Samsung/releases/download/v${version}/Apps2Samsung-v${version}-linux-x64.tar.gz";
    hash = "sha256-EmV0VwzIYSmk21oe8NjGx5vkV8HqnGhJOGTq26fH9Jk=";
  };
  sourceRoot = ".";

  nativeBuildInputs = [ pkgs.autoPatchelfHook pkgs.copyDesktopItems ];
  buildInputs = [ pkgs.stdenv.cc.cc.lib pkgs.fontconfig ];

  dontStrip = true;  # stripping breaks the .NET single-file bundle

  desktopItems = [
    (pkgs.makeDesktopItem {
      name = "apps2samsung";
      desktopName = "Apps2Samsung";
      comment = "Install apps on Samsung TVs, projectors and monitors";
      exec = "apps2samsung";
      icon = "apps2samsung";
      categories = [ "Utility" "Network" ];
    })
  ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/lib/apps2samsung $out/bin
    cp -r Apps2Samsung Assets libHarfBuzzSharp.so libSkiaSharp.so $out/lib/apps2samsung/
    chmod +x $out/lib/apps2samsung/Apps2Samsung
    echo ${version} > $out/lib/apps2samsung/.version
    install -Dm644 Assets/jelly2sams.png $out/share/pixmaps/apps2samsung.png

    # upstream writes next to its binary, so run from a writable copy
    cat > $out/bin/apps2samsung <<'EOF'
    #!/bin/sh
    set -e
    install_dir="@out@/lib/apps2samsung"
    data_dir="''${XDG_DATA_HOME:-$HOME/.local/share}/apps2samsung"

    if [ "$(cat "$data_dir/.version" 2>/dev/null)" != "$(cat "$install_dir/.version")" ]; then
      mkdir -p "$data_dir"
      cp -r "$install_dir/." "$data_dir/"
      chmod -R u+w "$data_dir"
    fi

    export LD_LIBRARY_PATH="@libs@''${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
    cd "$data_dir"
    exec ./Apps2Samsung "$@"
    EOF
    chmod +x $out/bin/apps2samsung
    substituteInPlace $out/bin/apps2samsung \
      --subst-var-by out $out \
      --subst-var-by libs "${pkgs.lib.makeLibraryPath runtimeLibs}"

    runHook postInstall
  '';

  meta = with pkgs.lib; {
    mainProgram = "apps2samsung";
    description = "Side-load apps onto Samsung Tizen TVs, projectors and monitors";
    homepage = "https://github.com/Apps2Samsung/Apps2Samsung";
    license = licenses.mit;
    platforms = [ "x86_64-linux" ];
    sourceProvenance = [ sourceTypes.binaryNativeCode ];
  };
}
