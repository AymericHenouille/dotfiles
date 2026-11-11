local support = require("configs.support")

vim.api.nvim_create_autocmd("FileType", {
  pattern = support.treesitters(),
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
    vim.bo.indentexpr = "v:lua.require(\"nvim-treesitter\").indentexpr()" -- indentation
  end,
})
