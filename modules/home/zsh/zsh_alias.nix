{ ... }:
{
  programs.zsh = {
    shellAliases = {
      # General
      ls = "lsd -a";
      ll = "lsd -a -l";
      c = "clear";
      # Nixos
      cdnix = "cd ~/nixos-config && codium ~/nixos-config";
      ns = "nom-shell --run zsh";
      nd = "nom develop --command zsh";
      nb = "nom build";
      nc = "nh clean all --keep 5";
      nft = "nh os test";
      nfs = "nh os switch";
      nfu = "nh os switch --update";
    };
  };
}
