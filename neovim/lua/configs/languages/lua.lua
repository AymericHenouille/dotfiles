return {
  treesitters = { "lua", "luadoc" },
  lspservers = { "lua_ls" },
  handlers = {
    ["lua_ls"] = function(lspconfig, opts)
      local table = require("features.table")
      return function()
        lspconfig.lua_ls.setup(table.mergetables({
          opts,
          {
            settings = {
              Lua = {
              },
            },
          },
        }))
      end
    end,
  },
}
