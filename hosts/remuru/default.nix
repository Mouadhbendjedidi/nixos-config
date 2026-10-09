{ pkgs, me, ... }:
{
  imports = [
    ../../modules/core
    ../../home/mouadh
    ./hardware-configuration.nix
    ../../modules/desktop/plymouth.nix
  ];

  services.gnome.gcr-ssh-agent.enable = false;
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # locale
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ar_DZ.UTF-8";
    LC_IDENTIFICATION = "ar_DZ.UTF-8";
    LC_MEASUREMENT = "ar_DZ.UTF-8";
    LC_MONETARY = "ar_DZ.UTF-8";
    LC_NAME = "ar_DZ.UTF-8";
    LC_NUMERIC = "ar_DZ.UTF-8";
    LC_PAPER = "ar_DZ.UTF-8";
    LC_TELEPHONE = "ar_DZ.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  users.users.${me}.extraGroups = [ "networkmanager" ];

    # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  programs.hyprland = {
  enable = true;
  withUWSM = true;
  xwayland.enable = true;
  };


  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.11";
}
