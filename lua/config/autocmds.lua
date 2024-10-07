-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function augroup(name)
  return vim.api.nvim_create_augroup("somallg_" .. name, { clear = true })
end

-- Fix conceallevel for markdown files
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = augroup("markdown_conceal"),
  pattern = { "markdown" },
  callback = function()
    vim.opt_local.conceallevel = 0
  end,
})

-- Reset cursor on quit
vim.api.nvim_create_autocmd("VimLeavePre", {
  group = augroup("exit"),
  command = "set guicursor=a:ver25",
  desc = "Set cursor back to beam when leaving Neovim.",
})
