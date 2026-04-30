{ ... }:
{
  programs.starship = {
    enable = true;

    enableZshIntegration = true;
    enableBashIntegration = true;

    settings = {
      add_newline = true;

      format = ''
        $username$hostname$directory$git_branch$git_status$nix_shell
        $character'';

      username = {
        disabled = false;
	show_always = true;
	style_user = "green bold";
	style_root = "red bold";
	format = "[ $user]($style) ";
      };

      hostname = {
        disabled = false;
	ssh_only = true;
	ssh_symbol = " ";
	format = "in [$ssh_symbol$hostname](bold blue)";
      };

      character = {
        disabled = false;
        success_symbol = "[󱞪](green)";
        error_symbol = "[󱞪](red)";
      };

      directory = {
        style = "blue";
        truncation_length = 4;
        truncation_symbol = "…/";
	home_symbol = "󰋞 ";
        read_only_style = "red";
        read_only = "  ";
        format = "[at $path]($style)[$read_only]($read_only_style) ";

	substitutions = {
          "󰋞 /Documents" = "󰈙 ";
          "󰋞 /documents" = "󰈙 ";

          "󰋞 /Downloads" = " ";
          "󰋞 /downloads" = " ";

          "󰋞 /media/music" = " ";
          "󰋞 /media/pictures" = " ";
          "󰋞 /media/videos" = " ";
          "󰋞 /Music" = " ";
          "󰋞 /Pictures" = " ";
          "󰋞 /Videos" = " ";

          "󰋞 /dev" = "󱌢 ";
          "󰋞 /Dev" = "󱌢 ";

          "󰋞 /study" = "󰑴 ";
          "󰋞 /.config" = " ";
	  };
      };

      git_branch = {
        symbol = " ";
        style = "bold red";
        format = "on [$symbol$branch]($style) ";
      };

      git_status = {
        format = "[$all_status]()";
        ahead = "[ ($count) ](green)";
        behind = "[ ($count) ](yellow)";
        staged = "[ ($count) ](cyan)";
        conflicted = "[ ($count) ](red)";
        modified = "[ ($count) ](yellow)";
        deleted = "[ ($count) ](red)";
        untracked = "[ ($count) ](blue)";
        renamed = "[ ($count) ](purple)";
        stashed = "[ ($count) ](blue)";
      };

      nix_shell = { disabled = false; format = "[  Nix Shell](blue)"; };

      line_break = { disabled = false; };
    };

  };
}
