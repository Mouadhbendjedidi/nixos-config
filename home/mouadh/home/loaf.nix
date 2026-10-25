{ inputs, pkgs, ... }:
{
  home.packages = [
    inputs.loaf-fm.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  # Evergarden colors for loaf (matches the Caelestia scheme)
  xdg.stateFile."quickshell/user/generated/colors.json".text = builtins.toJSON {
    background = "#1E2528";
    surface_container_lowest = "#171C1F";
    surface_container_low = "#222A2E";
    surface_container = "#262F33";
    surface_container_high = "#2E383C";
    surface_container_highest = "#374145";
    primary = "#CBE3B3";
    on_primary = "#1E2528";
    primary_container = "#5B6759";
    on_primary_container = "#CBE3B3";
    secondary_container = "#526761";
    on_secondary_container = "#B3E3CA";
    tertiary_container = "#51646A";
    on_surface = "#F8F9E8";
    on_surface_variant = "#ADC9BC";
    outline = "#6F8788";
    outline_variant = "#4A585C";
  };
}
