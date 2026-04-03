{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nnn
    zip
    unzip
    eza
    bat
    ripgrep
    git
    fastfetch
    (dooit.overrideAttrs (old: {
      propagatedBuildInputs = old.propagatedBuildInputs ++ [ dooit-extras ];
    }))
  ];
}
