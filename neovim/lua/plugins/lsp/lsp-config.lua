return {
  "williamboman/mason-lspconfig.nvim",
  name = "mason-lspconfig",
  dependencies = {
    { "neovim/nvim-lspconfig", name = "nvim-lspconfig" },
    require("plugins.lsp.mason"),
    require("plugins.lsp.completion"),
  },
  config = function()
    local mason_lspconfig = require("mason-lspconfig")
    local support = require("configs.support")

    local handlers = support.handlers(vim.lsp.config --[[@as LspConfigFn]], {
      capabilities = require("blink.cmp").get_lsp_capabilities(),
    })

    for servername, handler in pairs(handlers) do
      handler(servername)
    end

    mason_lspconfig.setup({
      ensure_installed = support.lspservers(),
      automatic_installation = true,
    })
  end,
}
