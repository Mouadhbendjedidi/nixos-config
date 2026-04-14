{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (dooit.overrideAttrs (old: {
      propagatedBuildInputs = old.propagatedBuildInputs ++ [ dooit-extras ];
    }))

  home.file.".config/dooit/config.py".text = ''
  ''
}
