{ pkgs, inputs, ... }:

let
  pkgs94p = import inputs.prism94 { system = pkgs.system; };
in
{
  home.packages = (with pkgs; [
    nnn
    zip
    unzip
    eza
    bat
    ripgrep
    git
    osu-lazer-bin
  ]) ++ [ pkgs94p.prismlauncher ];
}
