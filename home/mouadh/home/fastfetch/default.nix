{ ... }:

{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = ./diablo_ascii_color.txt;
        type = "file-raw";
        padding = {
          right = 2;
        };
      };

      display = {
        separator = " ⟡ ";
        color = {
          keys = "34";
          title = "35";
        };
      };

      modules = [
        {
          type = "title";
          format = "「 {1}@{2} 」";
          color = {
            user = "35";
            at = "34";
            host = "36";
          };
        }
        { type = "separator"; string = "◈━━━━━━━━━━━━━━━━━━━━━◈"; color = "34"; }
        { type = "os";       key = "◦ Nation  "; keyColor = "34"; }
        { type = "kernel";   key = "◦ Blessing "; keyColor = "34"; }
        { type = "uptime";   key = "◦ Age      "; keyColor = "35"; }
        { type = "packages"; key = "◦ Skills   "; keyColor = "35"; }
        { type = "separator"; string = "◈━━━━━━━━━━━━━━━━━━━━━◈"; color = "34"; }
        { type = "shell";    key = "◦ Tongue   "; keyColor = "36"; }
        { type = "terminal"; key = "◦ Gate     "; keyColor = "36"; detectPlugin = false; }
        { type = "separator"; string = "◈━━━━━━━━━━━━━━━━━━━━━◈"; color = "34"; }
        { type = "cpu";      key = "◦ Core     "; keyColor = "33"; }
        { type = "gpu";      key = "◦ Magic    "; keyColor = "33"; }
        { type = "separator"; string = "◈━━━━━━━━━━━━━━━━━━━━━◈"; color = "34"; }
        { type = "memory";   key = "◦ Magicule "; keyColor = "32"; }
        { type = "disk";     key = "◦ Territory"; keyColor = "32"; folders = "/"; }
        { type = "separator"; string = "◈━━━━━━━━━━━━━━━━━━━━━◈"; color = "34"; }
        { type = "colors";   symbol = "circle"; }
      ];
    };
  };
}
