return {
	"rose-pine/neovim",
	name = "rose-pine",
  opts = {
  },
	config = function(_, opts)
    vim.api.nvim_set_option_value("termguicolors", true, {})
    local rosepine = require("rose-pine")
    rosepine.setup(opts)
		vim.cmd("colorscheme rose-pine")
	end
}
