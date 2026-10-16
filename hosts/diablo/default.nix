{ config, lib, pkgs, me, inputs, ... }:

{
  imports = [
    ../../modules/core
    ../../home/mouadh
    inputs.nixos-wsl.nixosModules.default # NixOS WSL Module so i can declaratively manage my WSL env
  ];

  wsl.enable = true;

  # username & hostname 
  wsl.defaultUser = me;

  programs.nix-ld.enable = true;

  system.stateVersion = "25.05";
}
