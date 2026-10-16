{ ... }:
{
  imports = [ 
    ./networking.nix
    ./ssh.nix
    ./fonts.nix
    ./extras.nix
    ./timezone.nix
    ./certs.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
