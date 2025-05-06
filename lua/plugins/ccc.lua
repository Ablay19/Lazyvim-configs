return {
  "uga-rosa/ccc.nvim",
  config = function()
    require("ccc").setup()
    vim.keymap.set("n", "<leader>cp", "<cmd>CccPick<CR>", { desc = "Color Picker" })
  end,
}
