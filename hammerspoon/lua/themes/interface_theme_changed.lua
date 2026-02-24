local function current_theme()
  local out = hs.execute("/usr/bin/defaults read -g AppleInterfaceStyle 2>/dev/null"):gsub("%s+$", "")
  return (out == "Dark") and "Dark" or "Light"
end

local function run_hook()
  local theme = current_theme()
  local task = hs.task.new("/bin/zsh", nil, { "-lc", [[~/.bin/appearance-hook.sh ]] .. theme })
  task:start()
end

local notifications = hs.distributednotifications.new(run_hook, "AppleInterfaceThemeChangedNotification")
notifications:start()

run_hook()
