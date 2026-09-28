local M = {}

local appearance_hook = os.getenv("HOME") .. "/.bin/appearance-hook.sh"

M.update_theme = function()
  local out = hs.execute("/usr/bin/defaults read -g AppleInterfaceStyle 2>/dev/null") or ""
  local theme = (out:gsub("%s+$", "") == "Dark") and "Dark" or "Light"
  local task = hs.task.new("/bin/zsh", nil, { "-c", appearance_hook .. theme })
  task:start()
end

return M
