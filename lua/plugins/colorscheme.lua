return {
  -- {
  --   "rose-pine/neovim",
  --   name = "rose-pine",
  --   config = function()
  --     require("rose-pine").setup {
  --       disable_background = true,
  --       styles = {
  --         bold = false,
  --         italic = false,
  --       },
  --     }
  --     vim.cmd "colorscheme rose-pine"
  --   end,
  -- },

  -- {
  --   "catppuccin/nvim",
  --   config = function()
  --     require("catppuccin").setup {
  --       flavour = "mocha",
  --       no_italic = true,
  --       no_bold = false,
  --       transparent_background = true,
  --       -- color_overrides = {
  --       --   mocha = {
  --       --     base = "#000000",
  --       --     mantle = "#000000",
  --       --     crust = "#000000",
  --       --   },
  --       -- },
  --     }
  --
  --     vim.cmd.colorscheme "catppuccin"
  --   end,
  -- },

  -- {
  --   "lunarvim/darkplus.nvim",
  --   config = function()
  --     vim.cmd "colorscheme darkplus"
  --   end,
  -- },

  -- {
  --   "anAcc22/sakura.nvim",
  --   dependencies = "rktjmp/lush.nvim",
  --   config = function()
  --     vim.opt.background = "dark" -- or "light"
  --     vim.cmd "colorscheme sakura" -- sets the colorscheme
  --
  --     for _, group in ipairs(vim.fn.getcompletion("", "highlight")) do
  --       local hl = vim.api.nvim_get_hl(0, { name = group })
  --       local changed = false
  --
  --       if hl.italic then
  --         hl.italic = false
  --         changed = true
  --       end
  --
  --       if hl.bold then
  --         hl.bold = false
  --         changed = true
  --       end
  --
  --       if changed then
  --         vim.api.nvim_set_hl(0, group, hl)
  --       end
  --     end
  --   end,
  -- },

  {
    "cdmill/neomodern.nvim",
    priority = 1000,
    config = function()
      require("neomodern").setup {
        theme = "gyokuro",
        transparent = true,
      }
      require("neomodern").load()
      for _, group in ipairs(vim.fn.getcompletion("", "highlight")) do
        local hl = vim.api.nvim_get_hl(0, { name = group })
        if hl.italic then
          hl.italic = false
          vim.api.nvim_set_hl(0, group, hl)
        end
      end
    end,
  },
}
