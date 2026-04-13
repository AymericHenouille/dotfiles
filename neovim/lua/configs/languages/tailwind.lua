return {
  treesitters = {},
  lspservers = { "tailwindcss" },
  handlers = {
    ["tailwindcss"] = function(lspconfig, opts)
      return function()
        local options = {
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
        }

        local full_options = vim.tbl_extend("force", { opts, options })
        lspconfig.tailwindcss.setup(full_options)
      end
    end,
  },
}
