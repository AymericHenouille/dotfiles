local M = {}

M.logLevel = "info"
M.runHookAtStartup = true
M.enableNotifications = true
M.appearanceHook = os.getenv("HOME") .. "/.hammerspoon/hooks/appearance-hook.sh"
M.execPath = "/usr/local/bin:/opt/homebrew/bin:/usr/bin:/bin:/usr/sbin:/sbin"
M.reloadHotkey = { {"cmd", "alt", "ctrl", "shift"}, "r" }

return M
