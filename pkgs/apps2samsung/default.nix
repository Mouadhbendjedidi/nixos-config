{ pkgs }:

let
  version = "2.8.1";
in
pkgs.appimageTools.wrapType2 {
  pname = "apps2samsung";
  inherit version;

  src = pkgs.fetchurl {
    url = "https://github.com/Apps2Samsung/Apps2Samsung/releases/download/v${version}/Apps2Samsung-v${version}-linux-x64.AppImage";
    hash = "sha256-jQ1DZgiTQVSL8qCSeLR/HVoFQGGrLAeW/zSjOE+oWhw=";
  };


  meta = with pkgs.lib; {
    mainProgram = "apps2samsung";
    description = "Side-load apps onto Samsung Tizen TVs, projectors and monitors";
    homepage = "https://github.com/Apps2Samsung/Apps2Samsung";
    license = licenses.mit;
    platforms = [ "x86_64-linux" ];
    sourceProvenance = [ sourceTypes.binaryNativeCode ];
  };
}
