{ pkgs, me, inputs, ... }:
{
  imports = [
    ../../modules/core
    ../../home/mouadh
    ./hardware-configuration.nix
    ../../modules/desktop/plymouth.nix
    ../../modules/desktop/wallpapers-evergarden.nix
    # ../../modules/hardware/nvidia.nix
    inputs.niri.nixosModules.niri
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

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
  # services.displayManager.noctalia-greeter = {
  #   enable = true;
  #
  #   settings = {
  #     user.default = me;
  #     keyboard.layout = "us";
  #
  #     appearance = {
  #       scheme = "Synced";
  #       theme_mode = "dark";
  #       font_family = "IoskeleyMono Nerd Font Mono";
  #       hide_logo = true;
  #       scheme_selector_position = "hidden";
  #
  #       palette = {
  #         primary = "#CBE3B3";
  #         on_primary = "#1E2528";
  #         secondary = "#B3E3CA";
  #         on_secondary = "#1E2528";
  #         tertiary = "#AFD9E6";
  #         on_tertiary = "#1E2528";
  #         error = "#F57F82";
  #         on_error = "#1E2528";
  #         surface = "#1E2528";
  #         on_surface = "#F8F9E8";
  #         surface_variant = "#262F33";
  #         on_surface_variant = "#ADC9BC";
  #         outline = "#58686D";
  #         shadow = "#171C1F";
  #         hover = "#374145";
  #         on_hover = "#F8F9E8";
  #       };
  #
  #       wallpaper.fill_color = "#1E2528";
  #     };
  #   };
  # };
  services.desktopManager.gnome.enable = true;
  programs.kdeconnect = {
    enable = true;
    package = pkgs.gnomeExtensions.gsconnect;
  };

  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };

  programs.hyprland.enable = true;

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
