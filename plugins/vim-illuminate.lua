return {
  {
    "RRethy/vim-illuminate",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts)
      require("illuminate").configure(opts)
    end,
  },
  {
    "catppuccin/nvim",
    optional = true,
    opts = { integrations = { illuminate = true } },
  },
}
