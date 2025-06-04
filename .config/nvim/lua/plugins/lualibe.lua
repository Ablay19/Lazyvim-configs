return {
  {
    "folke/tokyonight.nvim",
    opts = {
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
        functions = { italic = false },
        variables = { italic = false },
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "kyazdani42/nvim-web-devicons", -- for file‐type icons
      "SmiteshP/nvim-navic", -- for breadcrumbs
    },
    opts = function(_, opts)
      -- disable winbar in certain filetypes (e.g., dashboards, quickfix)
      opts.options.disabled_filetypes.winbar = { "neo-tree", "lazy", "alpha", "NvimTree" }

      -- Helper: show a filepath (with icon) or "[No Name]" if empty
      local function filename_component()
        local filename = vim.fn.expand("%:t")
        if filename == "" then
          return "[No Name]"
        end
        local icon, icon_highlight = require("nvim-web-devicons").get_icon(filename)
        if icon then
          return ("%s %s"):format(icon, filename)
        else
          return filename
        end
      end

      -- Helper: show LSP diagnostics (error/warning count) if any
      local function lsp_diag()
        local diagnostics = vim.diagnostic.get(0)
        local errs, warns, infos, hints = 0, 0, 0, 0
        for _, d in ipairs(diagnostics) do
          if d.severity == vim.diagnostic.severity.ERROR then
            errs = errs + 1
          elseif d.severity == vim.diagnostic.severity.WARN then
            warns = warns + 1
          elseif d.severity == vim.diagnostic.severity.INFO then
            infos = infos + 1
          elseif d.severity == vim.diagnostic.severity.HINT then
            hints = hints + 1
          end
        end
        local components = {}
        if errs > 0 then
          table.insert(components, ("%s %d"):format("", errs))
        end
        if warns > 0 then
          table.insert(components, ("%s %d"):format("", warns))
        end
        if infos > 0 then
          table.insert(components, ("%s %d"):format("", infos))
        end
        if hints > 0 then
          table.insert(components, ("%s %d"):format("", hints))
        end
        return table.concat(components, " ")
      end

      -- Helper: breadcrumb navigator (nvim-navic)
      local navic = require("nvim-navic")
      local function navic_component()
        if navic.is_available() then
          return navic.get_location({ highlight = true })
        end
        return ""
      end

      -- Now configure the winbar itself
      opts.winbar = {
        -- left side: file icon + name (truncated if long)
        lualine_a = { filename_component },
        -- center: breadcrumbs (e.g., “Module > Class > Function”)
        lualine_b = { navic_component },
        -- right side: LSP diagnostics
        lualine_c = { lsp_diag },
      }

      -- Optionally show a custom separator or padding:
      opts.options.section_separators = { left = "", right = "" }
      opts.options.component_separators = { left = "│", right = "│" }
    end,
  },
}
