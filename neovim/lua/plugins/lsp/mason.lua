return {
  "williamboman/mason.nvim",
  name = "mason",
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
