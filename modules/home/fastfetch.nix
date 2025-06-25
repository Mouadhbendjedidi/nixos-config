{ pkgs, ... }:
{
  home.packages = with pkgs; [ fastfetch nitch ];
}
