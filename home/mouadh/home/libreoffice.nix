{ pkgs, ... }:
{
  home.packages = with pkgs; [
    libreoffice
    hunspell
    hunspell.en_US
    hunspell.fr_FR
    hunspell.ar_DZ
  ];
}
