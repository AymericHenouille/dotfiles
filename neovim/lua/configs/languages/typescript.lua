local lsp_loader = require("features.lsp_loader")

---@type LanguageConfig
return {
  treesitters = { "typescript", "angular" },
  lspservers = { "ts_ls" },
  handlers = {
    ["ts_ls"] = lsp_loader.handler_with_options({
      settings = {
        quoteStyle = "single",
      },
    }),
  },
}
