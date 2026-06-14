return {
  treesitters = { "typescript", "angular" },
  lspservers = { "ts_ls" },
  handlers = {
    ["ts_ls"] = function(lspconfig, opts)
      local options = vim.tbl_extend("force", opts, {
        settings = {
          quoteStyle = "single",
        },
      })
      return function()
        lspconfig("ts_ls", options)
      end
    end,
  },
}
