{ pkgs }:

pkgs.stdenvNoCC.mkDerivation {
  pname = "estedad";
  version = "0-unstable-2026-07-19";

  src = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/aminabedi68/Estedad/0dbe689787b8c2ea302373cb601d0f352f9f98e5/fonts/variable/Estedad%5Bwght%5D.ttf";
    hash = "sha256-GzzOixFCUgGRLnszEdCKwrECEchjNaHiBawxMZysDoU=";
  };

  dontUnpack = true;

  installPhase = ''
    install -Dm444 $src "$out/share/fonts/truetype/Estedad[wght].ttf"
  '';

  meta = {
    description = "Arabic-Latin sans-serif typeface";
    homepage = "https://github.com/aminabedi68/Estedad";
    license = pkgs.lib.licenses.ofl;
  };
}
