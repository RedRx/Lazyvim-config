-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- local discipline = require("bearydev.discipline")

-- discipline.cowboy()

local Util = require("lazyvim.util")
local keymap = vim.keymap
local opts = { noremap = true, silent = true, nowait = true }

local function show_relative_path()
  local relative_path = vim.fn.expand("%")
  print("Relative Path: " .. relative_path)
end

local function show_project_path()
  local project_path = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
  if vim.v.shell_error ~= 0 then
    project_path = vim.fn.getcwd()
  end
  print("Project Path: " .. project_path)
end

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
    title = "",
  }
  vim.lsp.buf.execute_command(params)
end

-- Do things without affecting the registers
-- keymap.set("n", "x", '"_x')
-- keymap.set("n", "<Leader>p", '"0p')
-- keymap.set("n", "<Leader>P", '"0P')
-- keymap.set("v", "<Leader>p", '"0p')
-- keymap.set("n", "<Leader>c", '"_c')
-- keymap.set("n", "<Leader>C", '"_C')
-- keymap.set("v", "<Leader>c", '"_c')
-- keymap.set("v", "<Leader>C", '"_C')
-- keymap.set("n", "<Leader>d", '"_d')
-- keymap.set("n", "<Leader>D", '"_D')
-- keymap.set("v", "<Leader>d", '"_d')
-- keymap.set("v", "<Leader>D", '"_D')

-- override default
keymap.set("n", "<leader>|", "", opts) -- disable Vertical split
keymap.set("n", "<leader>-", "", opts) -- disable Horizontal split
keymap.set("n", ";", ":", opts)

keymap.set("n", "<leader>$", function()
  return show_relative_path()
end, { desc = "Show Relative Path" })
keymap.set("n", "<leader>%", function()
  return show_project_path()
end, { desc = "Show Relative th" })
keymap.set("n", "Dw", "vb_d", opts) -- delete word backward
keymap.set("n", "<C-a>", "gg<S-v>G", opts) -- select all
keymap.set("n", "mk", "<cmd>m-2<cr>", opts) -- move line up
keymap.set("n", "mj", "<cmd>m+1<cr>", opts) -- move line down
keymap.set("n", "+", "<cmd>vertical resize +1<cr>", opts)
keymap.set("n", "_", "<cmd>vertical resize -1<cr>", opts)
keymap.set("n", ")", "<cmd>horizontal resize +1<cr>", opts)
keymap.set("n", "(", "<cmd>horizontal resize -1<cr>", opts)
keymap.set("n", "x", '"_x', opts)
keymap.set("n", "c", '"_c', opts)
keymap.set("n", "X", '"_X', opts)
keymap.set("n", "C", '"_C', opts)
keymap.set("i", "jk", "<ESC>", opts) -- Quick exit insert mode
keymap.set("n", "<leader>v", "<cmd>:vsplit<cr>", { desc = "Vertical Split" })
keymap.set("n", "<leader>V", "<cmd>:split<cr>", { desc = "Horizontal Split" })
keymap.set("n", "<leader>O", function()
  return organize_imports()
end, { desc = "TS Organize imports" })

-- Override mini-buf-remove
keymap.set("n", "<leader>d", function()
  local bd = require("mini.bufremove").delete
  if vim.bo.modified then
    local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
    if choice == 1 then -- Yes
      vim.cmd.write()
      bd(0)
    elseif choice == 2 then -- No
      bd(0, true)
    end
  else
    bd(0)
  end
end, { desc = "Delete Buffer" })
keymap.set("n", "<leader>o", function()
  if vim.bo.filetype == "neo-tree" then
    vim.cmd.wincmd("p")
  else
    vim.cmd.Neotree("focus")
  end
end, { desc = "Toggle Explorer Focus" })

keymap.set("n", "<leader>fw", function()
  require("telescope.builtin").live_grep()
end, { desc = "Find words" })
keymap.set("n", "<leader>fW", function()
  require("telescope.builtin").live_grep({
    additional_args = function(args)
      return vim.list_extend(args, { "--hidden", "--no-ignore" })
    end,
  })
end, { desc = "Find words in all files" })

keymap.set("n", "<leader>fk", function()
  require("telescope.builtin").keymaps()
end, { desc = "Find keymaps" })

keymap.set("n", "<leader>fo", function()
  require("telescope.builtin").oldfiles()
end, { desc = "Find historys" })
--
-- Diagnostics
keymap.set("n", "gl", function()
  vim.diagnostic.open_float()
end, { desc = "Show diagnostics hover" })

keymap.set("n", "gj", function()
  vim.diagnostic.goto_next()
end, { desc = "Go to next diagnostic" })

keymap.set("n", "gk", function()
  vim.diagnostic.goto_prev()
end, { desc = "Go to previous diagnostic" })

keymap.set("n", "<leader>R", function()
  require("bearydev.hsl").replaceHexWithHSL()
end, { desc = "replaceHexWithHSL" })

keymap.set(
  "n",
  "<leader>?",
  "<cmd> Telescope current_buffer_fuzzy_find <CR>",
  { desc = "Fuzzy find in current buffer" }
)

keymap.set({ "n", "v" }, "gm", function()
  Util.format({ force = true })
end, { desc = "Format" })

vim.keymap.set("n", "<leader>zP", "<cmd>PickColor<cr>", { desc = "Pick Color" })
vim.keymap.set("i", "<leader>zI", "<cmd>PickColorInsert<cr>", { desc = "Pick Color Insert" })
vim.keymap.set("n", "<leader>zh", "<cmd>ConvertHEXandRGB<cr>", { desc = "ConvertHEXandRGB" })
vim.keymap.set("n", "<leader>zH", "<cmd>ConvertHEXandHSL<cr>", { desc = "ConvertHEXandHSL" })

require("color-picker").setup({ -- for changing icons & mappings
  ["icons"] = { "ﱢ", "" },
  -- ["icons"] = { "ﮊ", "" },
  -- ["icons"] = { "", "ﰕ" },
  -- ["icons"] = { "", "" },
  -- ["icons"] = { "", "" },
  -- ["icons"] = { "ﱢ", "" },
  ["border"] = "rounded", -- none | single | double | rounded | solid | shadow
  ["keymap"] = { -- mapping example:
    ["U"] = "<Plug>ColorPickerSlider5Decrease",
    ["O"] = "<Plug>ColorPickerSlider5Increase",
  },
  ["background_highlight_group"] = "Normal", -- default
  ["border_highlight_group"] = "FloatBorder", -- default
  ["text_highlight_group"] = "Normal", --default
})
-- vim.cmd([[hi FloatBorder guibg=NONE]]) -- if you don't want weird border background colors around the popup.
