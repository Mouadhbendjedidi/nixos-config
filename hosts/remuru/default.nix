{ lib, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/core
  ];
  
}
