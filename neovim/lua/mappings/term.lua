local mapper = require("features.map")
local tmap = mapper.tmap
local nmap = mapper.nmap

nmap("<LEADER>tt", "<CMD>ToggleTerm direction=tab<CR>", "Open a terminal in a tab.")
nmap("<LEADER>th", "<CMD>ToggleTerm direction=horizontal<CR>", "Open a terminal in an horizontal window.")
nmap("<LEADER>tv", "<CMD>ToggleTerm direction=vertical<CR>", "Open a terminal in a vertial window.")
nmap("<LEADER>tf", "<CMD>ToggleTerm direction=float<CR>", "Open a terminal in a floating window.")

tmap("<C-x>", "<C-\\><C-n>", "Leave the terminal focus.")
