local nmap = require("features.map").nmap

nmap("<LEADER>ww", "<CMD>w<CR>", "Save the current file.")
nmap("<LEADER>wa", "<CMD>wa<CR>", "Save all opened files.")
nmap("<LEADER>q", "<CMD>qa<CR>", "Quit the current buffer.")
nmap("<LEADER>x", "<CMD>xa<CR>", "Save all opened files and quit neovim.")
