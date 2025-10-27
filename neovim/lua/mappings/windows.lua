local map = require("features.map")
local nmap = map.nmap

nmap("<C-h>", "<C-w><C-h>", "Move focus to the left windows.")
nmap("<C-j>", "<C-w><C-j>", "Move focus to the down windows.")
nmap("<C-k>", "<C-w><C-k>", "Move focus to the up windows.")
nmap("<C-l>", "<C-w><C-l>", "Move focus to the right windows.")

nmap(";", ":", "Enter in command mode.")
