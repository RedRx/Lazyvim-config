return {
  "smjonas/inc-rename.nvim",
  opts = {},
  keys = {
    {
      "<leader>R",
      function()
        require("inc_rename")
        return ":IncRename " .. vim.fn.expand("<cword>")
      end,
      expr = true,
      desc = "IncRename",
    },
  },
}
