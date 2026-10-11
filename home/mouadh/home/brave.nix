{ ... }:
{
  programs.brave = {
    enable = true;
    extensions = [
      { id = "nngceckbapebfimnlniiiahkandclblb"; }  # Bitwarden
      { id = "clngdbkpkpeebahjckkjfobafhncgmne"; }  # Stylus
      { id = "ghbmnnjooekpmoecnnnilnnbdlolhkhi"; }  # google docs offline
    ];
  };
}
