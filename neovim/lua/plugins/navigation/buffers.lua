return {
  {
    "romgrk/barbar.nvim",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "lewis6991/gitsigns.nvim",
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    lazy = false,
    opts = {},
  },
}

