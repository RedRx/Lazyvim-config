return {
  "catppuccin/nvim",
  name = "catppuccin",
  opts = {
    integrations = {
      nvimtree = true,
      ts_rainbow = true,
      aerial = true,
      dap = { enabled = true, enable_ui = true },
      mason = true,
      neotree = true,
      notify = true,
      semantic_tokens = true,
      symbols_outline = true,
      telescope = true,
      which_key = true,
      sandwich = false,
      noice = true,
      mini = true,
      leap = true,
      markdown = true,
      neotest = true,
      cmp = true,
      overseer = true,
      lsp_trouble = true,
      ts_rainbow2 = true,
    },
  },
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      term_colors = true,
      transparent_background = true,
      no_italic = false,
      no_bold = false,
      styles = {
        comments = {},
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
      },
      color_overrides = {
        mocha = {
          base = "#000000",
          mantle = "#000000",
          crust = "#000000",

          -- base = "#252740",
          -- mantle = "#61afee",
          -- crust = "#14141f",
          -- rosewater = "#f5e0dc",
          -- flamingo = "#f2cdcd",
          -- pink = "#f5c2e7",
          -- mauve = "#cba6f7",
          -- red = "#f38ba8",
          -- maroon = "#eba0ac",
          -- peach = "#fab387",
          -- yellow = "#f9e2af",
          -- green = "#a6e3a1",
          -- teal = "#94e2d5",
          -- sky = "#89dceb",
          -- sapphire = "#74c7ec",
          -- blue = "#89b4fa",
          -- lavender = "#b4befe",
          -- text = "#cdd6f4",
          -- subtext1 = "#bac2de",
          -- subtext0 = "#a6adc8",
          -- overlay2 = "#9399b2",
          -- overlay1 = "#7f849c",
          -- overlay0 = "#6c7086",
          -- surface2 = "#585b70",
          -- surface1 = "#45475a",
          -- surface0 = "#313244",
        },
        -- all = {
        --   text = "#ffffff",
        -- },
      },
      highlight_overrides = {
        mocha = function(C)
          return {
            TabLineSel = { bg = C.pink },
            CmpBorder = { fg = C.surface2 },
            Pmenu = { bg = C.none },
            TelescopeBorder = { link = "FloatBorder" },
          }
        end,
      },
    })
  end,
}
