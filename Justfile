deploy:
  sudo nixos-rebuild switch --flake .

build:
  sudo nixos-rebuild build --flake .

debug:
  sudo nixos-rebuild switch --flake . -v -L

update:
  nix flake update

upp:
  nix flake update && sudo nixos-rebuild switch --flake .


