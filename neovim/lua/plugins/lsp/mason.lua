return {
  "williamboman/mason.nvim",
  name = "mason",
  tag = "v2.1.0",
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
}
