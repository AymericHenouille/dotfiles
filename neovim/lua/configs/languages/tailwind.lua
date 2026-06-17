local lsp_loader = require("features.lsp_loader")

---@type LanguageConfig
return {
  treesitters = {},
  lspservers = { "tailwindcss" },
  handlers = {
    ["tailwindcss"] = lsp_loader.handler_with_options({
      filetypes = {
        "templ",
        "vue",
        "html",
        "astro",
        "javascript",
        "typescript",
        "react",
        "htmlangular",
      },
    }),
  },
}
