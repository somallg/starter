local ts_utils = require("nvim-treesitter.ts_utils")
local toggleterm = require("toggleterm")

local M = {}

local function get_code_block_at_cursor()
  if vim.bo.filetype ~= "markdown" then
    return
  end

  local code_block_node = ts_utils.get_node_at_cursor()

  while code_block_node and code_block_node:type() ~= "program" do
    code_block_node = code_block_node:parent()
  end

  if code_block_node == nil then
    return
  end

  return vim.treesitter.get_node_text(code_block_node, vim.fn.bufnr("%"))
end

function M.exec_code_block_at_cursor()
  local code_block = get_code_block_at_cursor()

  if code_block == nil then
    print("No code found at cursor")
    return
  end

  toggleterm.exec(code_block)
end

return M
