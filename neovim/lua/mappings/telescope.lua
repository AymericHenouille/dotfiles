local nmap = require("features.map").nmap
nmap("<LEADER>ff", "<CMD>Telescope find_files<CR>", "Telescope find files")
nmap("<LEADER>fg", "<CMD>Telescope live_grep<CR>", "Telescope live grep")
nmap("<LEADER>fb", "<CMD>Telescope scope buffers<CR>", "Telescope buffers")
nmap("<LEADER>fq", "<CMD>Telescope quickfix<CR>", "Telescope open quickfix list")
nmap("<LEADER>fe", "<CMD>Telescope symbols<CR>", "Telescope open emoji")
