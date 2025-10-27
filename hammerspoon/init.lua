hs.loadSpoon("EmmyLua")

require("lua.themes.interface_theme_changed")

hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "R", hs.reload)
hs.alert.show("Hammerspoon config reloaded")
