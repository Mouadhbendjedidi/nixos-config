{ ... }:
{
  boot.plymouth = {
    enable = true;
    theme = "bgrt";
  };

  boot.initrd.systemd.enable = true;
  boot.initrd.verbose = false;
  boot.consoleLogLevel = 0;
  boot.initrd.kernelModules = [ "amdgpu" ];

  boot.kernelParams = [ "quiet" "splash" "udev.log_level=3" ];
}
