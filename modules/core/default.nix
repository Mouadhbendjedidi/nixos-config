{ ... }:
{
  imports = [ 
    ./networking.nix
    ./ssh.nix
    ./fonts.nix
    ./extras.nix
    ./timezone.nix
  ];
}
