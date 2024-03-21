return {
  {
    "echasnovski/mini.move",
    keys = {
      -- { "<C-h>", mode = "n", desc = "Move line left" },
      -- { "<C-j>", mode = "n", desc = "Move line down" },
      -- { "<C-k>", mode = "n", desc = "Move line up" },
      -- { "<C-l>", mode = "n", desc = "Move line right" },
      { "<C-h>", mode = "v", desc = "Move selection left" },
      { "<C-j>", mode = "v", desc = "Move selection down" },
      { "<C-k>", mode = "v", desc = "Move selection up" },
      { "<C-l>", mode = "v", desc = "Move selection right" },
    },
    opts = {
      mappings = {
        left = "<C-h>",
        right = "<C-l>",
        down = "<C-j>",
        up = "<C-k>",
        -- line_left = "<A-h>",
        -- line_right = "<A-l>",
        -- line_down = "<A-j>",
        -- line_up = "<A-k>",
      },
    },
  },
  {
    "catppuccin/nvim",
    optional = true,
    ---@type CatppuccinOptions
    opts = { integrations = { mini = true } },
  },
}
