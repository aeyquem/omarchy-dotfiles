-- Personal window rules. Loaded from hypr/bindings.lua, because
-- hypr/hyprland.lua is Omarchy's stock file and stays untracked in yadm.
-- See https://wiki.hypr.land/configuring/core/rules/window-rules/

-- App workspaces: chat apps on 5, music on 8.
o.window("discord", { workspace = "5" })
-- WhatsApp Web is a Firefox PWA, whose window class is an opaque FFPWA-* id.
-- Match its first window title instead, which is the readable "WhatsApp Web".
o.window({ initial_title = "^WhatsApp Web$" }, { workspace = "5" })
o.window("[Ss]potify", { workspace = "8" })
