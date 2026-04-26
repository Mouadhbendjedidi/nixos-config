{ pkgs }:

pkgs.buildNpmPackage {
  pname = "instagram-cli";
  version = "1.4.0";
  src = pkgs.fetchFromGitHub {
    owner = "supreme-gg-gg";
    repo = "instagram-cli";
    rev = "ts-v1.4.5";
    hash = "sha256-Ni/+69qBq34pluNDWdqDpfvNXlVLwIhjHLIhl+SbAYA=";
  };

  npmDepsHash = "sha256-DJ553OtamDRtVJ6BR0YrfjHIQJ8VIe8d/QPMlmJIW4E=";
  npmDepsFetcherVersion = 2;
  
  meta = with pkgs.lib; {
    mainProgram = "instagram-cli";
    description = "Unofficial CLI and terminal client for Instagram";
    homepage = "https://github.com/supreme-gg-gg/instagram-cli";
    license = licenses.mit;
  };
}
