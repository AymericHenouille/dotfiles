local theme = require("lua.theme")
local run_hook = theme.update_theme

local notifications = hs.distributednotifications.new(run_hook, "AppleInterfaceThemeChangedNotification")

if notifications then
  print("notification start")
  notifications:start()
end

run_hook()

