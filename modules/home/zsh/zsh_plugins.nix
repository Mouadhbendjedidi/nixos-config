{ ... }:
{
  programs.zsh = {
      plugins = [
    {
      name = "zsh-completions";
      src = pkgs.fetchFromGitHub {
        owner = "zsh-users";
        repo = "zsh-completions";
        rev = "master";
        sha256 = "sha256-qCoBWdBZMVmhnd2m5ffXxu0anGigJexeN0KgS+9bmvg=";
      };
    }
    {
      name = "fzf-tab";
      src = pkgs.fetchFromGitHub {
        owner = "Aloxaf";
        repo = "fzf-tab";
        rev = "master";
        sha256 = "sha256-zc9Sc1WQIbJ132hw73oiS1ExvxCRHagi6vMkCLd4ZhI=";
      };
    }
  ];
    }
}