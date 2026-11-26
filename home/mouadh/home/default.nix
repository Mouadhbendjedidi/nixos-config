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
    ./git.nix
    ./brave.nix
    ./gnome.nix
    ./evergarden.nix
    ./alacritty.nix
    ./artcraft.nix
    ./niri
    ./hyprland.nix
    ./cursors.nix
    ./spicetify.nix
    ./loaf.nix
    ./obsidian.nix
    ./browser.nix
  ];
}
