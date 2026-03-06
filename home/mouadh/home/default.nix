{ pkgs, ... }:
{
  imports = [
    ./shells
    ./fzf.nix
    ./starship
    ./zoxide
    ./packages
  ];
}
