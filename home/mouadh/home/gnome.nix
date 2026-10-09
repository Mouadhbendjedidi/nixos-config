{ pkgs, ... }:
{
  home.packages = [ pkgs.gnomeExtensions.dash-to-dock ];

  dconf.settings = {
    "org/gnome/shell" = {
      favorite-apps = [
        "brave-browser.desktop"
        "org.gnome.Nautilus.desktop"
        "kitty.desktop"
      ];
      enabled-extensions = [ "dash-to-dock@micxgx.gmail.com" ];
    };
  };
}
