return {
  "williamboman/mason-lspconfig.nvim",
  name = "mason-lspconfig",
  dependencies = {
    { "neovim/nvim-lspconfig", name = "nvim-lspconfig" },
    require("plugins.lsp.mason"),
    require("plugins.lsp.completion"),
  },
  config = function()
    local masonlspconfig = require("mason-lspconfig")
    local lspconfig = require("lspconfig")
    local support = require("configs.support")
    local capabilities = require("blink.cmp").get_lsp_capabilities()
    masonlspconfig.setup({
      ensure_installed = support.lspservers,
      automatic_installation = true,
      handlers = support.handlers(lspconfig, {
        capabilities = capabilities,
      }),
    })
  end,
}
