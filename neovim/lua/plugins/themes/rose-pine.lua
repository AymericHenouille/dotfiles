return {
	"rose-pine/neovim",
	name = "rose-pine",
  opts = {
  },
	config = function(_, opts)
    local rosepine = require("rose-pine")
    rosepine.setup(opts)
		vim.cmd("colorscheme rose-pine")
	end
}
