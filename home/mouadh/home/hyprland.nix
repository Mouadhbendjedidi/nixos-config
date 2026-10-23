{ inputs, ... }:
{
  imports = [ inputs.caelestia-shell.homeManagerModules.default ];

  programs.caelestia = {
    enable = true;
    systemd.enable = false; # started from Hyprland, so it doesn't clash with niri's Noctalia
  };

  xdg.configFile."hypr/hyprland.lua".text = ''
    hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1 })

    hl.config({
        input = { kb_layout = "us" },
    })

    hl.on("hyprland.start", function()
        hl.exec_cmd("caelestia shell -d")
    end)

    -- Apps and windows
    hl.bind("SUPER + Return", hl.dsp.exec_cmd("ghostty"))
    hl.bind("SUPER + Q", hl.dsp.window.close())
    hl.bind("SUPER + F", hl.dsp.window.fullscreen({ mode = "fullscreen" }))
    hl.bind("SUPER + ALT + Space", hl.dsp.window.float())
    hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
    hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

    -- Caelestia shell
    hl.bind("SUPER + SUPER_L", hl.dsp.global("caelestia:launcher"), { release = true })
    hl.bind("CTRL + ALT + Delete", hl.dsp.global("caelestia:session"))
    hl.bind("SUPER + N", hl.dsp.global("caelestia:sidebar"))
    hl.bind("SUPER + L", hl.dsp.global("caelestia:lock"))

    -- Focus and move windows
    for _, dir in ipairs({ "left", "right", "up", "down" }) do
        hl.bind("SUPER + " .. dir, hl.dsp.focus({ direction = dir }))
        hl.bind("SUPER + SHIFT + " .. dir, hl.dsp.window.move({ direction = dir }))
    end

    -- Workspaces 1-9
    for i = 1, 9 do
        hl.bind("SUPER + " .. i, hl.dsp.focus({ workspace = i }))
        hl.bind("SUPER + ALT + " .. i, hl.dsp.window.move({ workspace = i }))
    end
  '';
}
