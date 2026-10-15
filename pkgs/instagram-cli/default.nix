{ pkgs }:

pkgs.buildNpmPackage {
  pname = "instagram-cli";
  version = "2.0.1";
  src = pkgs.fetchFromGitHub {
    owner = "supreme-gg-gg";
    repo = "instagram-cli";
    rev = "ts-v2.0.1";
    hash = "sha256-sBRHi/SFbytaF8QICp3RF4bHnSP4GUmd3jfAIZH1YjU=";
  };

  npmDepsHash = "sha256-NAfk3IZj775aabc3U2Id/JpfE2PdDhUAT+udDv2rrZI=";
  npmDepsFetcherVersion = 2;
  
  meta = with pkgs.lib; {
    mainProgram = "instagram-cli";
    description = "Unofficial CLI and terminal client for Instagram";
    homepage = "https://github.com/supreme-gg-gg/instagram-cli";
    license = licenses.mit;
  };
}
