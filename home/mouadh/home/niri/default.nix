{ inputs, ... }:
{
  imports = [
    inputs.niri.homeModules.niri
    inputs.noctalia.homeModules.default
    inputs.vicinae.homeManagerModules.default
  ];

  programs.niri = {
    enable = true;
    settings = {
      prefer-no-csd = true;
      input.keyboard.xkb = {
        layout = "us";
        variant = "intl";
      };
      layout = {
        gaps = 4;
        focus-ring = {
          enable = true;
          width = 2;
        };
      };
    };
  };
}
