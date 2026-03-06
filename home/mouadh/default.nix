{ pkgs, inputs, me, host, ... }:
{

  imports = [ 
    inputs.home-manager.nixosModules.home-manager
    inputs.nixos-wsl.nixosModules.default
  ];

  # username & hostname 
  wsl.defaultUser = me;
  
  users.users.${me} = {
    isNormalUser = true;
    description = me;
    extraGroups = [ "wheel" ]; # Sudo access
    shell = pkgs.zsh;
    home = "/home/${me}";
  };

  # zsh btw!
  programs.zsh.enable = true;
  programs.bash.enable = true;


  home-manager = {
    
    extraSpecialArgs = { inherit inputs me host; };
    useUserPackages = true;
    useGlobalPkgs = true;
    
    users.${me} = { 

        home.username = me;
        home.homeDirectory = "/home/${me}";

        imports = [ ./home ]

        home.stateVersion = "25.05";
        programs.home-manager.enable = true;

    };
  };    
  
}
