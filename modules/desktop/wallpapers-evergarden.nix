{inputs, pkgs, ...}: {
  environment = {
    etc."wallpapers".source = inputs.wallpapers.packages.${pkgs.system}.full;
  };
}
