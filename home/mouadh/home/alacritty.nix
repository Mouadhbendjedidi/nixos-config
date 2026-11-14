{ config, pkgs, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      font.size = 12.0;
      font.normal.family = "IoskeleyMono Nerd Font";
      window = {
        opacity = 0.8;
	blur = true;
        dimensions = {
          columns = 100;
          lines = 30;
        };
      };
    };
  };
}   
