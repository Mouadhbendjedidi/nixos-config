{ ... }:
{
  imports = [
    ./audacious.nix                   # music player
    ./bat.nix                         # better cat command
    ./browser.nix                     # firefox based browser
    ./btop.nix                        # resouces monitor 
    ./cava.nix                        # audio visualizer
    ./discord.nix                     # discord
    ./fastfetch.nix                   # fetch tool
    ./ghostty.nix                     # terminal
    ./git.nix                         # version control
    ./gnome.nix                       # gnome apps
    ./gtk.nix                         # gtk theme
    ./hyprland                        # window manager
    ./kitty.nix                       # terminal
    ./lazygit.nix
    ./micro.nix                       # nano replacement
    ./nemo.nix                        # file manager
    ./nix-search/nix-search.nix       # TUI to search nixpkgs
    ./nvim.nix                        # neovim editor
    ./obsidian.nix
    ./packages                        # other packages
    ./rofi.nix                        # launcher
    ./ssh.nix                         # ssh config
    ./swaylock.nix                    # lock screen
    ./swayosd.nix                     # brightness / volume wiget
    ./swaync/swaync.nix               # notification deamon
    ./vscodium                        # vscode fork
    ./waybar                          # status bar
    ./waypaper.nix                    # GUI wallpaper picker
    ./zsh                             # shell
  ];
}
