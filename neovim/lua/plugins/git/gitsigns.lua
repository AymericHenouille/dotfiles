return {
  "lewis6991/gitsigns.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  event = { "BufEnter" },
  opts = {
    auto_attach = true,
    signcolumn = true,
    numhl = false,
    linehl = false,
    word_diff = false,
    current_line_blame = true,
    on_attach = function()
      local gitsigns = require("gitsigns")
      local nmap = require("features.map").nmap
      nmap("]c", function()
        if not vim.wo.diff then
          gitsigns.nav_hunk("next")
        end
      end, "Navigate to the next git hunk")

      nmap("[c", function()
        if not vim.wo.diff then
          gitsigns.nav_hunk("prev")
        end
      end, "Navigate to the previous git hunk")

      nmap("<LEADER>hp", gitsigns.preview_hunk, "Preview the hunk under the cursor")
      nmap("<LEADER>hr", gitsigns.reset_hunk, "Reset the hunk under the cursor")

      nmap("<LEADER>tb", gitsigns.toggle_current_line_blame "Toggle the git blame line")
      nmap("<LEADER>td", gitsigns.toggle_deleted, "Toggle the deleted git lines")
      nmap("<LEADER>tw", gitsigns.toggle_word_diff, "Toggle git word diff")

      nmap("<LEADER>hh", function()
        gitsigns.toggle_linehl()
        gitsigns.toggle_numhl()
      end, "Toggle highlight git hunk")
    end
  },
}

