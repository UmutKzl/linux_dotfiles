-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "H", "0", { desc = "Go to start of the line" })
vim.keymap.set("n", "L", "$", { desc = "Go to end of the line" })
