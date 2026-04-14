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
      signByDefault = true;
    };
    settings = {
      user.name = "Mouadhbendjedidi";
      user.email = "alfadjr2007@gmail.com";
      commit.gpgsign = true;
      gpg.format = "ssh";
      gpg.ssh.allowedSignersFile = "~/.config/git/allowed_signers";
      user.signingKey = "~/.ssh/id_ed25519.pub";
      gpg.ssh.signingKey = "~/.ssh/id_ed25519.pub";
      core.editor = "nvim";
      init.defaultBranch = "main";
      pull.rebase = true;
      merge.conflictstyle = "diff3";
      diff.colorMoved = "default";
      "url \"http://gitea.veldora.bn/\"".insteadOf = "gitea:";
      "url \"https://github.com/\"".insteadOf = "gh:";
      alias = {
        s  = "status";
        st = "status --short --branch";
        lg = "log --oneline --graph --decorate --all";
        co = "checkout";
        br = "branch";
      };
    };
  };

  home.file.".config/git/allowed_signers".text = ''
    alfadjr2007@gmail.com ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO5mu2tvT1ERq+h7ukJmbC1IyOas+oROdwHqJfr1veRm
  '';
}
