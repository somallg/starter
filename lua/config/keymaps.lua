-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local terminal = require("somallg.terminal")

vim.keymap.set("n", "<C-c><C-c>", terminal.exec_code_block_at_cursor, { desc = "Execute code at cursor" })
