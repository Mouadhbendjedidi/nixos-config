{ pkgs, myPkgs, ... }:
{
  home.packages = with pkgs; [
    catppuccin-whiskers
    catppuccin-catwalk
    myPkgs.instagram-cli
    myPkgs.apps2samsung
    neovim
    myPkgs.prismlauncher
    zapzap
    telegram-desktop
    vesktop
    feishin
  ];
}
