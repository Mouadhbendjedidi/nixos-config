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
    systemd.enable = true;   # starts with the session, no spawn-at-startup needed
    settings = {
      shell.font = "IoskeleyMono Nerd Font";
      theme = { mode = "dark"; source = "builtin"; builtin = "Catppuccin"; };
    };
  };

  programs.vicinae = { enable = true; systemd.enable = true; };
}
