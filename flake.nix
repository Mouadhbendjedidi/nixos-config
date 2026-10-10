{
  description = "Mouadh's flake";

  inputs = {
 
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    prism94.url = "github:NixOS/nixpkgs/28ace32529a63842e4f8103e4f9b24960cf6c23a"; # pinning prismlauncher 9.4 for minecraft offline works

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
      inputs.nixpkgs.follows = "nixpkgs";
      };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
      };

    evergarden.url = "https://codeberg.org/evergarden/nix/archive/main.tar.gz";

    wallpapers = {
      url = "github:everviolet/wallpapers";
      inputs.nixpkgs.follows = "nixpkgs";
      };

  };

  outputs = { self, nixpkgs, nixos-wsl, home-manager, prism94, ... }@inputs: 

    let

      me = "mouadh";
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      myPkgs = import ./pkgs {
        inherit pkgs system prism94;
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

	remuru = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ ./hosts/remuru ];
          specialArgs = { host = "remuru"; inherit myPkgs self inputs me; };
        };

      };
    };
}
