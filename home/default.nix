{ pkgs, ... }:

{
  imports = [
    ./shells
    ./fzf.nix
    ./zoxide.nix
    ./packages.nix
    ./starship.nix
  ];
}
