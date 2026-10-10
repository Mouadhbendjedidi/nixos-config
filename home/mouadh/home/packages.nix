{ pkgs, myPkgs, ... }:
{
  home.packages = with pkgs; [
    catppuccin-whiskers
    catppuccin-catwalk
    myPkgs.instagram-cli
    neovim
    myPkgs.prismlauncher
    zapzap
    telegram-desktop
    vesktop
  ];
}
