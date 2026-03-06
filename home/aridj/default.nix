{ pkgs, inputs, sis, host, ... }:
{

  imports = [ 
    inputs.home-manager.nixosModules.home-manager
  ];

  # username & hostname 
  networking.hostName = host;
  
  users.users.${sis} = {
    isNormalUser = true;
    description = sis;
    extraGroups = [ "wheel" ]; # Sudo access
    shell = pkgs.zsh;
    home = "/home/${sis}";
  };

  # zsh btw!
  programs.zsh.enable = true;
  programs.bash.enable = true;


  home-manager = {
    
    extraSpecialArgs = { inherit inputs sis host; };
    useUserPackages = true;
    useGlobalPkgs = true;
    
    users.${sis} = { 

        home.username = sis;
        home.homeDirectory = "/home/${sis}";

        imports = [ ../../home/${sis} ];

        home.stateVersion = "25.05";
        programs.home-manager.enable = true;

    };
  };    
  
}
