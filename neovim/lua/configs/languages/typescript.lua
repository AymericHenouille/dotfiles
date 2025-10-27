return {
  treesitters = { "typescript", "angular" },
  lspservers = { "ts_ls" },
  handlers = {
    ["ts_ls"] = function(lspconfig, opts)
      local options = {
        settings = {
          quoteStyle = "single",
        },
      }
      return function()
        local full_options = vim.tbl_extend("force", { opts, options })
        lspconfig.ts_ls.setup(full_options)
      end
    end,
  },
}
