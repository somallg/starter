return {
  "akinsho/toggleterm.nvim",
  cmd = { "ToggleTerm", "TermExec" },
  opts = {
    direction = "vertical",
    shading_factor = 2,
    size = function()
      return bit.rshift(vim.o.columns, 1)
    end,
  },
}
