-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")
-- Replace Omarchy's SUPER+CTRL+E emoji shortcut with SUPER+PERIOD.
hl.unbind("SUPER + CTRL + E")
o.bind("SUPER + PERIOD", "Emojis", "omarchy-shell shell toggle omarchy.emojis")
o.bind("SUPER + SHIFT + S", "Screenshot", "omarchy screenshot")

-- Dwindle tree controls (Super+Ctrl+Shift+Arrow).
o.bind("SUPER + CTRL + SHIFT + LEFT", "Dwindle: Promote to root (same side)",
  hl.dsp.layout("movetoroot active"))
o.bind("SUPER + CTRL + SHIFT + RIGHT", "Dwindle: Promote to root (other side)",
  hl.dsp.layout("movetoroot active unstable"))
o.bind("SUPER + CTRL + SHIFT + UP", "Dwindle: Swap focused split", hl.dsp.layout("swapsplit"))

-- Change an existing binding by unbinding it first, then binding the key again.
-- This example changes SUPER+SPACE from the launcher to the Omarchy root menu.
-- hl.unbind("SUPER + SPACE")
-- o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle root")

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")

-- Logitech MX Keys examples:
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, "omarchy-shell shell toggle omarchy.emojis")

-- strata-installer: file-manager start
hl.unbind("SUPER + SHIFT + F")
hl.unbind("SUPER + ALT + SHIFT + F")
o.bind("SUPER + SHIFT + F", "File manager", { launch = "/home/alejandro/.local/bin/strata" })
o.bind("SUPER + ALT + SHIFT + F", "File manager (cwd)",
  "uwsm-app -- /home/alejandro/.local/bin/strata \"$(omarchy-cmd-terminal-cwd)\"")
-- strata-installer: file-manager end

-- omaframe:shortcuts:start
-- Added by Omaframe. Delete this block to restore Omarchy's defaults.
hl.unbind("PRINT")
o.bind("PRINT", "Screenshot with Omaframe", "'/home/alejandro/Projects/omaframe/build/omaframe' --capture")
hl.unbind("ALT + PRINT")
o.bind("ALT + PRINT", "Record with Omaframe", "'/home/alejandro/Projects/omaframe/build/omaframe' --record")
hl.unbind("ALT + SHIFT + PRINT")
o.bind("ALT + SHIFT + PRINT", "Pause recording with Omaframe", "'/home/alejandro/Projects/omaframe/build/omaframe' --toggle-recording-pause")
hl.unbind("CTRL + PRINT")
o.bind("CTRL + PRINT", "Screenshot and choose a finish with Omaframe", "'/home/alejandro/Projects/omaframe/build/omaframe' --capture --chooser")
-- omaframe:shortcuts:end

-- Restore the Tmux terminal binding that `omarchy remove preinstalls` disabled.
-- (Was SUPER + ALT + RETURN -> omarchy-launch-terminal-tmux.)
o.bind("SUPER + ALT + RETURN", "Tmux", { omarchy = "terminal-tmux" })

-- Swap SUPER+F and SUPER+CTRL+F so the actions are backwards:
-- Super+F -> maximized (fills the workspace, shell bar stays visible)
-- Super+Ctrl+F -> true fullscreen (full window, bar hidden)
hl.unbind("SUPER + F")
hl.unbind("SUPER + ALT + F")
o.bind("SUPER + F", "Maximized (keep bar)", hl.dsp.window.fullscreen({ mode = "maximized" }))
o.bind("SUPER + ALT + F", "Fullscreen (hide bar)", hl.dsp.window.fullscreen({ mode = "fullscreen" }))

-- Personal window rules (loaded here because hyprland.lua stays untracked).
require("hypr.windows")
