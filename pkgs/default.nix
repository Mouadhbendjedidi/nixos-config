{ pkgs, lib, system, prism94 }:

let
  pinned = import prism94 { inherit system; };
in
{
  instagram-cli = pkgs.callPackage ./instagram-cli { };
  prismlauncher = pinned.prismlauncher;
}
