{ inputs, ... }:
{
  imports = [ inputs.evergarden.homeManagerModules.default ];

  evergarden = {
    enable = true; # enable all modules
    variant = "winter";
    accent = "green";

    ghostty.enable = true;
    tmux.enable = true;

    # enable the cache
    cache.enable = true;
  };
}
