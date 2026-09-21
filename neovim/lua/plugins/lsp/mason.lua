return {
  "williamboman/mason.nvim",
  name = "mason",
  tag = "v2.2.1",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  },
  config = function(_, opts)
    local success, mason = pcall(require, "mason")
    if success then
      mason.setup(opts)
      -- vim.call("MasonUpdate")
    end
  end,
}
