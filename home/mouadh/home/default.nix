{ pkgs, ... }:
{
  imports = [
    ./shells
    ./fzf.nix
    ./starship.nix
    ./zoxide.nix
    ./packages.nix
    ./fastfetch
    ./tmux.nix
    ./dooit.nix
  ];
}
