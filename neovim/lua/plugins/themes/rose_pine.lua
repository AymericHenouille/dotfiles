return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function(_, opts)
    local rose_pine = require("rose-pine")
    rose_pine.setup(opts)
		vim.cmd("colorscheme rose-pine")
	end
}
