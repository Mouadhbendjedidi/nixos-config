{ pkgs, ... }:
{
  programs.ghostty = {
    enable = true;
    
    settings = {

      font-family = "IoskeleyMono Nerd Font Mono";
      font-size = 12;
      font-codepoint-map = "U+1F300-U+1FAFF=Apple Color Emoji";
      
      background-opacity = 0.8;
      window-decoration = true;
    };
  };
}   
