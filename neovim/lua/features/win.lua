---Determine if a floating window is rended.
---@return (boolean) has_floating_win It will be true if a floating window is on the screen.
local hasfloatingwin = function()
  local windows = vim.api.nvim_list_wins()
  for _, win in ipairs(windows) do
    local confg = vim.api.nvim_win_get_config(win)
    if confg.relative ~= "" then
      return true
    end
  end
  return false
end

return {
  hasfloatingwin = hasfloatingwin,
}
