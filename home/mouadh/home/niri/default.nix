{ inputs, pkgs, ... }:
{
  imports = [
    inputs.noctalia.homeModules.default
    inputs.vicinae.homeManagerModules.default
  ];

  programs.niri.settings = {
    prefer-no-csd = true;
    environment."NIXOS_OZONE_WL" = "1";
    input.keyboard.xkb = {
      layout = "us,ara";
      options = "grp:alt_shift_toggle";
    };
    layout = { gaps = 8; focus-ring = { enable = true; width = 2; }; };

    binds = {
      "Mod+Return".action.spawn = [ "ghostty" ];
      "Mod+D".action.spawn = [ "vicinae" "toggle" ];
      "Mod+Q".action.close-window = [ ];
      "Mod+H".action.focus-column-left = [ ];
      "Mod+L".action.focus-column-right = [ ];
      "Mod+J".action.focus-window-down = [ ];
      "Mod+K".action.focus-window-up = [ ];
      "Mod+Shift+H".action.move-column-left = [ ];
      "Mod+Shift+L".action.move-column-right = [ ];
      "Mod+F".action.maximize-column = [ ];
      "Mod+Shift+F".action.fullscreen-window = [ ];
      "Mod+1".action.focus-workspace = [ 1 ];
      "Mod+2".action.focus-workspace = [ 2 ];
      "Mod+3".action.focus-workspace = [ 3 ];
      "Print".action.screenshot = [ ];
      "Mod+Shift+Slash".action.show-hotkey-overlay = [ ];
      "Mod+Shift+E".action.quit = [ ];
    };
  };


  programs.noctalia = {
    enable = true;
    package = pkgs.noctalia;
    systemd.enable = true;

    settings = {
      shell.font = "IoskeleyMono Nerd Font Mono";

      theme = {
        mode = "dark";
        source = "custom";
        custom_palette = "evergarden";
      };

      bar.main = {
        position = "left";
        thickness = 56;
        margin_ends = 10;
        radius = 16;
        capsule = true;
        start = [ "launcher" "workspaces" ];
        center = [ "clock" ];
        end = [ "tray" "notifications" "network" "bluetooth" "volume" "control-center" "session" ];
      };
    };

    customPalettes.evergarden = {
      dark = {
        mPrimary = "#CBE3B3";
        mOnPrimary = "#1E2528";
        mSecondary = "#B3E3CA";
        mOnSecondary = "#1E2528";
        mTertiary = "#AFD9E6";
        mOnTertiary = "#1E2528";
        mError = "#F57F82";
        mOnError = "#1E2528";
        mSurface = "#1E2528";
        mOnSurface = "#F8F9E8";
        mSurfaceVariant = "#262F33";
        mOnSurfaceVariant = "#ADC9BC";
        mOutline = "#58686D";
        mShadow = "#171C1F";
        mHover = "#374145";
        mOnHover = "#F8F9E8";

        terminal = {
          background = "#1E2528";
          foreground = "#F8F9E8";
          cursor = "#CBE3B3";
          cursorText = "#1E2528";
          selectionBg = "#4A585C";
          selectionFg = "#F8F9E8";
          normal = {
            black = "#374145"; red = "#F57F82"; green = "#CBE3B3"; yellow = "#F5D098";
            blue = "#B2CAED"; magenta = "#F3C0E5"; cyan = "#B3E3CA"; white = "#96B4AA";
          };
          bright = {
            black = "#6F8788"; red = "#F57F82"; green = "#CBE3B3"; yellow = "#F5D098";
            blue = "#B2CAED"; magenta = "#F3C0E5"; cyan = "#B3E3CA"; white = "#ADC9BC";
          };
        };
      };
    };
  };

  programs.vicinae = { enable = true; systemd.enable = true; };
}
