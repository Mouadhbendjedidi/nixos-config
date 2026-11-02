{ pkgs, me, ... }:

{
  programs.obsidian = {
    enable = true;
    vaults.notes.target = "/home/${me}/obsidian";
  };
}
