{ pkgs, ... }:
{
  programs.ghostty = {
    enable = true;
    
    settings = {

      font-family = "IoskeleyMono Nerd Font";
      font-size = 12;
      
      background-opacity = 0.8;
      window-decoration = true;
    };
  };
}   
