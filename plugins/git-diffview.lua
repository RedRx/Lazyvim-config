return {
  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    cmd = { "DiffviewOpen" },
    opts = {
      enhanced_diff_hl = true,
      view = {
        default = { winbar_info = true },
        file_history = { winbar_info = true },
      },
      hooks = {
        diff_buf_read = function(bufnr)
          vim.b[bufnr].view_activated = false
        end,
      },
    },
    keys = {
      { "<leader>D", desc = "Diffview" },
      { "<leader>Do", "<cmd>DiffviewOpen<cr>", desc = "Diffview: open" },
      { "<leader>Dc", "<cmd>DiffviewClose<cr>", desc = "Diffview: close" },
    },
  },
  {
    "NeogitOrg/neogit",
    optional = true,
    opts = { integrations = { diffview = true } },
  },
}
