-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Better escape
vim.keymap.set("i", "jk", "<Esc>", { silent = true, desc = "Esc with jk" })
vim.keymap.set("i", "jj", "<Esc>", { silent = true, desc = "Esc with jj" })
