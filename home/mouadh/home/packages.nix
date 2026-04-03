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
    fastfetch
    dooit
    dooit-extras
  ];
}
