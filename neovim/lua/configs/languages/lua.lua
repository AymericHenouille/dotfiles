local lsp_loader = require("features.lsp_loader");

---@type LanguageConfig
return {
  treesitters = { "lua", "luadoc" },
  lspservers = { "lua_ls" },
  handlers = {
    ["lua_ls"] = lsp_loader.handler_with_options({
      settings = {
        Lua = {

        },
      },
    })
  },
}
