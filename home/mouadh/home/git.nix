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
      key = "~/.ssh/id_ed25519.pub";
      signByDefault = true;
    };
    settings = {
      user.name = "Mouadhbendjedidi";
      user.email = "alfadjr2007@gmail.com";
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
    alfadjr2007@gmail.com sk-ssh-ed25519 YOUR_PUBLIC_KEY_CONTENT
  '';
}
