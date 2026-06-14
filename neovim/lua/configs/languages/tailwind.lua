return {
  treesitters = {},
  lspservers = { "tailwindcss" },
  handlers = {
    ["tailwindcss"] = function(lspconfig, opts)
      local options = vim.tbl_extend("force", opts, {
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
      })
      return function()
        lspconfig("tailwindcss", options)
      end
    end,
  },
}
