{ pkgs, ... }:

{
  imports = [ ./starship.nix ];
  home.packages = with pkgs; [
    nnn
    zip
    unzip
    eza
    bat
    ripgrep
    git
  ];
  home.shellAliases = {
    cd = "z";
    cat = "bat";
    c = "clear";
    l = "eza -lh --icons=auto";
    ll = "eza -lha --icons=auto --sort=name --group-directories-first";
    ls = "eza -1 --icons=auto";
    ld = "eza -lhD --icons=auto";
  };
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    historySubstringSearch.enable = true;
    syntaxHighlighting.enable = true;
    
    plugins = [{
      name = "fzf-tab";
      src = "${pkgs.zsh-fzf-tab}/share/fzf-tab";
    }];

    completionInit = ''
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
      zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"
      zstyle ':completion:*' menu no
      zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza $realpath'
      zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza $realpath'
    '';
    initContent = ''
      # Keybindings
      bindkey -e
      bindkey '^p' history-search-backward
      bindkey '^n' history-search-forward

      zle_highlight+=(paste:none)

      # History
      HISTSIZE=5000
      HISTFILE=~/.zsh_history
      SAVEHIST=$HISTSIZE
      setopt appendhistory
      setopt sharehistory
      setopt hist_ignore_space
      setopt hist_ignore_all_dups
      setopt hist_save_no_dups
      setopt hist_ignore_dups
      setopt hist_find_no_dups
    '';
  };
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
