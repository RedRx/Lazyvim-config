return {
  "norcalli/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup({
      "css",
      "typescript",
      "javascript",
      "javascriptreact",
      "typescriptreact",
      "tsx",
      "lua",
      "scss",
      "json",
      html = { mode = "foreground" },
    }, {
      RGB = true,
      RRGGBB = true,
      names = false,
      RRGGBBAA = true,
      rgb_fn = true,
      hsl_fn = true,
      css = true,
      css_fn = true,
    })
  end,
}
