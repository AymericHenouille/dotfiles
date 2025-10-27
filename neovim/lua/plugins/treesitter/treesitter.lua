return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = true,
  event = { "BufEnter" },
  opts = {
    ensure_installed = require("configs.support").treesitters,
    sync_install = true,
    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = { enable = true },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end
}
