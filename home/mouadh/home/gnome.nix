{ pkgs, lib, ... }:
{
  home.packages = [ pkgs.gnomeExtensions.dash-to-dock pkgs.gnomeExtensions.clipboard-indicator ];

  dconf.settings = {
    "org/gnome/shell" = {
      favorite-apps = [
        "brave-browser.desktop"
        "org.gnome.Nautilus.desktop"
        "com.mitchellh.ghostty.desktop"
	"com.rtosta.zapzap.desktop"
	"org.telegram.desktop.desktop"
	"vesktop.desktop"
      ];
      enabled-extensions = [ 
        "dash-to-dock@micxgx.gmail.com"
        "clipboard-indicator@tudmotu@gmail.com"
      ];
    };
  };

  dconf.settings = {
    "org/gnome/desktop/input-sources" = {
      sources = [
        (lib.hm.gvariant.mkTuple [ "xkb" "us" ])
        (lib.hm.gvariant.mkTuple [ "xkb" "ara" ])
      ];
      xkb-options = [ "grp:alt_shift_toggle" ];  # optional extra switch shortcut
    };
  };
}
