return {
  "goolord/alpha-nvim",
  config = function ()
    local dashboard = require("alpha.themes.dashboard")
    dashboard.section.header.val = require("features.ascii")["ewok"]
    dashboard.section.header.opts.hl = "ModeMsg"
    dashboard.section.buttons.val = {
      dashboard.button( "e", "  > New file" , "<CMD>ene <BAR> startinsert <CR>"),
      dashboard.button( "f", "  > Find file", "<CMD>Telescope find_files<CR>"),
      dashboard.button( "r", "  > Recent"   , "<CMD>Telescope oldfiles<CR>"),
      dashboard.button( "q", "  > Quit NVIM", "<CMD>qa<CR>"),
    }
    require("alpha").setup(dashboard.config)
  end
};
