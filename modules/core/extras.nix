{ pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    just # needed for shortcuts
    wget
    curl
    cmatrix
    nnn
    zip
    unzip
    eza
    bat
    ripgrep
  ];

}
