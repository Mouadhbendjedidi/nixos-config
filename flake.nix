{
  description = "Mouadh's flake";
  
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    nixos-wsl.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nixos-wsl, ... }@inputs: 
    let
      me = "mouadh";
      sis = "aridj";
      system = "x86_64-linux";
    in
    {
      nixosConfigurations = {
        
        diablo = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ ./hosts/diablo ];
          specialArgs = { host = "diablo"; inherit self inputs me; };

        };

        shion = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ ./hosts/shion ];
          specialArgs = { host = "shion"; inherit self inputs sis; };
        
        };
      };
    };
}
