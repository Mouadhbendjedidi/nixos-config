{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nnn
    zip
    unzip
    eza
    bat
    ripgrep
    git
    catppuccin-whiskers
    catppuccin-catwalk
  ];
}
