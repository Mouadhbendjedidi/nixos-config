{ pkgs, ... }:
{

  home.pointerCursor = {
    enable = true;
    name = "Bibata-Modern-Ice";       # or Bibata-Modern-Classic
    package = pkgs.bibata-cursors;
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  # Quickshell (caelestia) and Qt apps read these
  home.sessionVariables = {
    XCURSOR_THEME = "Bibata-Modern-Ice";
    XCURSOR_SIZE = "24";
  };
}
