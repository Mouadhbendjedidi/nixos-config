{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "Mouadhbendjedidi";
    userEmail = "alfadjr2007@gmail.com";
    delta = {
      enable = true;
      options = {
        navigate = true;
        dark = true;
      };
    };
    signing = {
      key = "~/.ssh/id_ed25519.pub";
      signByDefault = true;
    };
    extraConfig = {
      commit.gpgsign = true;
      gpg.format = "ssh";
      gpg.ssh.allowedSignersFile = "~/.config/git/allowed_signers";
      core.editor = "nvim";
      init.defaultBranch = "main";
      pull.rebase = true;
      merge.conflictstyle = "diff3";
      diff.colorMoved = "default";
      "url \"http://gitea.veldora.bn/\"".insteadOf = "gitea:";
      "url \"https://github.com/\"".insteadOf = "gh:";
    };
    aliases = {
      s  = "status";
      st = "status --short --branch";
      lg = "log --oneline --graph --decorate --all";
      co = "checkout";
      br = "branch";
    };
  };

  home.file.".config/git/allowed_signers".text = ''
    alfadjr2007@gmail.com sk-ssh-ed25519 ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO5mu2tvT1ERq+h7ukJmbC1IyOas+oROdwHqJfr1veRm alfadjr2007@gmail.com
  '';
}
