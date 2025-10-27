local map = require("features.map")
local nmap = map.nmap

---Create the opts used in map function.
---It add the noremap = true to the options.
---@param description string - The description.
---@return table opts The opts
local function create_opts(description)
  return {
    silent = true,
    desc = description,
    noremap = true,
  }
end

nmap("<TAB>", "<cmd>BufferNext<cr>", create_opts("Navigate to the next buffer"))
nmap("<S-TAB>", "<cmd>BufferPrevious<cr>", create_opts("Navigate to the previous buffer"))
nmap("<C-c>", "<CMD>BufferClose!<CR>", create_opts("Close the current buffer"))
nmap("<C-S-C>", "<cmd>BufferCloseAllButCurrent<cr>", create_opts("Close all buffers expect the current one"))
nmap("<c-,>", "<cmd>BufferMovePrevious<cr>", "Move tab to left")
nmap("<c-.>", "<cmd>BufferMoveNext<cr>", "Move tab to right")
nmap("<c-<>", "<cmd>BufferScrollLeft<cr>", "Scroll tab to left")
nmap("<c->>", "<cmd>BufferScrollRight<cr>", "Scroll tab to right")

nmap("<ESC><ESC>", "<CMD>noh<CR>", "Remove highlight")
