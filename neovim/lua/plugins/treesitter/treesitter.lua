return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = { "neovim-treesitter/treesitter-parser-registry" },
  opts = {

  },
  lazy = false,
  build = ':TSUpdate',
  config = function(_, opts)
    local support = require("configs.support")
    local treesitter = require("nvim-treesitter")
    treesitter.setup(opts)

    local parsers = support.treesitters()
    treesitter.install(parsers)
  end,
}
