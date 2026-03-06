{ host, ... }:
{
  networking.hostName = host;
  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = if host == "diablo" then false else true;
}
