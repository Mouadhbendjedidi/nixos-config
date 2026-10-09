{ ... }:
{
  boot.plymouth = {
    enable = true;
    theme = "bgrt";   # firmware logo + spinner, Ubuntu/Fedora style
  };

  boot.initrd.systemd.enable = true;      # splash starts early
  boot.initrd.verbose = false;
  boot.consoleLogLevel = 0;
  boot.initrd.kernelModules = [ "amdgpu" ];  # load the GPU early so the splash is smooth

  boot.kernelParams = [ "quiet" "splash" "udev.log_level=3" ];
}
