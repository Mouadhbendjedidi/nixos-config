{ inputs, ... }:
{
  imports = [ inputs.evergarden.homeManagerModules.default ];

  evergarden = {
    enable = true; # enable all modules
    variant = "winter";
    accent = "green";

    alacritty.enable = true;
    spicetify.enable = true;
    tmux.enable = true;

  };
}
