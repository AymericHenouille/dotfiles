return {
  treesitters = { "lua", "luadoc" },
  lspservers = { "lua_ls" },
  handlers = {
    ["lua_ls"] = function(lspconfig, opts)
      local options = vim.tbl_extend("force", opts, {
        settings = {
          Lua = {

          },
        },
      })
      return function()
        lspconfig("lua_ls", options)
      end
    end,
  },
}
