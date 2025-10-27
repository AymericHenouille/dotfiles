local hasfloatingwin = require("features.win").hasfloatingwin
local map = require("features.map")
local nmap = map.nmap

nmap("<LEADER>gR", "<cmd>Telescope lsp_references<CR>", "Show LSP references")
nmap("<LEADER>gD", vim.lsp.buf.declaration, "Go to declaration")
nmap("<LEADER>gd", "<cmd>Telescope lsp_definitions<CR>", "Show LSP definitions")
nmap("<LEADER>gi", "<cmd>Telescope lsp_implementations<CR>", "Show LSP implementations")
nmap("<LEADER>gt", "<cmd>Telescope lsp_type_definitions<CR>", "Show LSP type definitions")
nmap("<LEADER>ca", vim.lsp.buf.code_action, "See available code actions")
nmap("<LEADER>rn", vim.lsp.buf.rename, "Smart rename")
nmap("<LEADER>D", "<cmd>Telescope diagnostics bufnr=0<CR>", "Show buffer diagnostics")
nmap("<LEADER>d", function()
  if vim.diagnostic.is_enabled() then
    if not hasfloatingwin() then
      vim.diagnostic.open_float()
    end
  end
end, "Show buffer diagnostics in float")

nmap("[d", function()
  vim.diagnostic.jump({ count = -1, float = true })
end, "Go to previous diagnostic")
nmap("]d", function()
  vim.diagnostic.jump({ count = 1, float = true })
end, "Go to next diagnostic")

nmap("K", vim.lsp.buf.hover, "Show documentation for what is under cursor")
nmap("<LEADER>rs", ":LspRestart<CR>", "Restart LSP")
