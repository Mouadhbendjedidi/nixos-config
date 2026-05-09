{ config, lib, pkgs, me, inputs, ... }:

{
  imports = [
    ../../modules/core
    ../../home/mouadh
    inputs.nixos-wsl.nixosModules.default # NixOS WSL Module so i can declaratively manage my WSL env
  ];

  wsl.enable = true;

  programs.nix-ld.enable = true;

  # add experimental features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.05";
}
