{ pkgs, ... }:
{
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.graphics.enable = true;
  hardware.nvidia = {
    modesetting.enable = true;
    open = true;            # the open kernel module supports RTX 20-series and newer
    nvidiaSettings = true;
};
  nixpkgs.config.allowUnfree = true;  # the driver is unfree
}
