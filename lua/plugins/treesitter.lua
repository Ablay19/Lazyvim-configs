-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Treesitter
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(
        opts.ensure_installed, {
        "typescript",
        "tsx",
        "lua",
        "html", 
        "css"
      }
      )
    end,
  },
}
---@type LazySpec
-- return {
--   "nvim-treesitter/nvim-treesitter",
--   opts = {
--     ensure_installed = {
--       "lua",
--       "vim",
--       -- add more arguments for adding more treesitter parsers
--     },
--   },
-- }
