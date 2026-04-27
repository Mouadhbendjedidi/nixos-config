{ pkgs, ... }:

{

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      navigate = true;
      dark = true;
    };
  };

  programs.git = {
    enable = true;
    signing = {
      signByDefault = true; # adding verified commits!
    };
    settings = {
      user.name = "Mouadhbendjedidi"; # My Name!
      user.email = "alfadjr2007@gmail.com"; # My Email!
      commit.gpgsign = true; # gpg sign enabled
      gpg.format = "ssh";
      gpg.ssh.allowedSignersFile = "~/.config/git/allowed_signers";
      user.signingKey = "~/.ssh/id_ed25519.pub"; # my sign key
      gpg.ssh.signingKey = "~/.ssh/id_ed25519.pub"; # my sign key
      core.editor = "nvim"; # still not moved to neovim but i will still on vscode :(
      init.defaultBranch = "main";
      pull.rebase = true;
      merge.conflictstyle = "diff3";

      diff.colorMoved = "default";
      "url \"http://gitea.veldora.bn/\"".insteadOf = "gitea:";
      "url \"https://github.com/\"".insteadOf = "gh:";

      alias = {
        a = "add";
	aa = "add .";
        s  = "status";
        lg = "log --oneline --graph --decorate --all";
        br = "branch";
      };
    };
  };

  home.file.".config/git/allowed_signers".text = ''
    alfadjr2007@gmail.com ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO5mu2tvT1ERq+h7ukJmbC1IyOas+oROdwHqJfr1veRm
  '';
}
