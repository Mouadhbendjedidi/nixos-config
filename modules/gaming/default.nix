{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    extraCompatPackages = [ pkgs.proton-ge-bin ];
    gamescopeSession.enable = true; # optional, gives a console-style login session
  };

  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
    heroic      # Epic/GOG and other non-Steam games
    mangohud    # FPS/perf overlay
  ];
}
