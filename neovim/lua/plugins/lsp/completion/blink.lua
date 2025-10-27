return {
  "saghen/blink.cmp",
  version = "0.*",
  build = "cargo build --release",
  dependencies = {
    "xzbdmw/colorful-menu.nvim",
    require("plugins.lsp.completion.luasnip"),
  },
  opts = {
    keymap = { preset = "default" },
    completion = {
      ghost_text = { enabled = false },
      list = {
        selection = {
          preselect = true,
          auto_insert = true,
        },
      },
      menu = {
        border = "single",
        draw = {
          columns = {
            { "kind_icon" },
            { "label", gap = 1 },
          },
          components = {
            label = {
              text = function(ctx)
                return require("colorful-menu").blink_components_text(ctx)
              end,
              highlight = function(ctx)
                return require("colorful-menu").blink_components_highlight(ctx)
              end,
            },
          },
          treesitter = { "lsp" },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 500,
        window = { border = 'rounded' },
      },
    },
    signature = { enabled = true },
  },
}
