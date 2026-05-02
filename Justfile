deploy:
  sudo nixos-rebuild switch --flake .

debug:
  sudo nixos-rebuild switch --flake . -v -L

update:
  nix flake update

upp:
  nix flake update && sudo nixos-rebuild switch --flake .


