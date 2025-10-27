return {
  "stevearc/oil.nvim",
  name = "oil",
  lazy = true,
  keys = { "-" },
  opts = {
    default_file_explorer = true,
    skip_confirm_for_simple_edits = true,
    autosave_changes = true,
    view_options = {
      show_hidden = true,
    },
    float = {
      border = "double",
      preview_split = "right"
    },
  },
  config = function(_, opts)
    local oil = require("oil")
    oil.setup(opts)
    local nmap = require("features.map").nmap
    nmap("-", function()
      local hasfloatingwin = require("features.win").hasfloatingwin
      if not hasfloatingwin() then
        vim.cmd("Oil --float")
      end
    end, "Open parent directory with oil")
  end,
}
