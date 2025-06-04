-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", ";", ":")
vim.keymap.set("v", "<c-;>", "<ESC>:")
vim.keymap.set(
  "i",
  -- "jj",
  "jk",
  "<ESC>"
)

-- vim._on_key(function()
--   print("hi")
-- end)
