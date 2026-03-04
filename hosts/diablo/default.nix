# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ config, lib, pkgs, me, inputs, host, ... }:

{
  imports = [
    
    inputs.home-manager.nixosModules.home-manager
    inputs.nixos-wsl.nixosModules.default
  ];

  wsl.enable = true;

  # allowing unfree packages (like for eg: obsidian)
  nixpkgs.config.allowUnfree = true;

  # adding my needed packages
  environment.systemPackages = with pkgs; [
    wget
    curl
    cmatrix
    neovim
  ];
  
  home-manager = {
    
    extraSpecialArgs = { inherit inputs username host; };
    useUserPackages = true;
    useGlobalPkgs = true;
    
    users.${username} = { 

        home.username = username;
        home.homeDirectory = "/home/${username}";

        imports = [ ../../home/home.nix ];

        home.stateVersion = "25.05";
        programs.home-manager.enable = true;

    };
  };    
  
  # username & hostname 
  wsl.defaultUser = username;
  networking.hostName = host;
  
  users.users.${username} = {
    isNormalUser = true;
    description = username;
    extraGroups = [ "wheel" ]; # Sudo access
    shell = pkgs.zsh;
    home = "/home/${username}";
  };

  # zsh btw!
  programs.zsh.enable = true;
  
  # add experimental features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
