{
  description = "Mouadh's flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    prism94.url = "github:NixOS/nixpkgs/28ace32529a63842e4f8103e4f9b24960cf6c23a";

    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    nixos-wsl.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # dooit.url = "github:dooit-org/dooit";
    # dooit-extras.url = "github:dooit-org/dooit-extras";

  };

  outputs = { self, nixpkgs, nixos-wsl, home-manager, prism94, ... }@inputs: 
    let
      me = "mouadh";
      sis = "aridj";
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      myPkgs = import ./pkgs {
        inherit pkgs;
        inherit (pkgs) lib;
      };
    in
    {

      packages.${system} = myPkgs;

      nixosConfigurations = {
        
        diablo = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ ./hosts/diablo ];
          specialArgs = { host = "diablo"; inherit myPkgs self inputs me; };

        };

        shion = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ ./hosts/shion ];
          specialArgs = { host = "shion"; inherit myPkgs self inputs sis; };
        
        };
      };
    };
}
