{ pkgs, inputs, ... }:
{
  fonts.packages = with pkgs; [
    ioskeley-mono.nf
    noto-fonts-color-emoji
    inputs.apple-emoji.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  fonts.fontconfig.defaultFonts.emoji = [ "Apple Color Emoji" "Noto Color Emoji" ];

  fonts.fontconfig.localConf = ''
    <?xml version="1.0"?>
    <!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
    <fontconfig>
      <match target="pattern">
        <test name="family" qual="any"><string>Noto Color Emoji</string></test>
        <edit name="family" mode="assign" binding="strong"><string>Apple Color Emoji</string></edit>
      </match>

      <match target="font">
        <test name="family"><string>Apple Color Emoji</string></test>
        <edit name="scalable" mode="assign"><bool>true</bool></edit>
      </match>
    </fontconfig>
  '';
}
