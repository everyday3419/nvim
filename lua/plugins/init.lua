return {
  { lazy = true, "nvim-lua/plenary.nvim" },

  -- {
  --   "numToStr/Sakura.nvim",
  --   priority = 1000,
  -- },

  {
    "rebelot/kanagawa.nvim",
    config = function()
      require("kanagawa").setup {
        commentStyle = { italic = false },
        keywordStyle = { italic = false },
        overrides = function(colors)
          local theme = colors.theme
          return {
            ["@variable.builtin"] = { italic = false },
            Visual = { bg = theme.ui.bg_p2 },
          }
        end,
        background = {
          dark = "dragon",
        },
      }
      local cmp = require "cmp"
      cmp.setup {
        window = {
          completion = cmp.config.window.bordered {
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
          },
          documentation = cmp.config.window.bordered {
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
          },
        },
      }
    end,
  },

  -- {
  --   "catppuccin/nvim",
  --   config = function()
  --     require("catppuccin").setup {
  --       flavour = "mocha",
  --       no_italic = true,
  --       no_bold = false,
  --     }
  --   end,
  -- },

  -- {
  --   "EdenEast/nightfox.nvim",
  --   priority = 1000,
  -- },

  -- {
  --   "folke/tokyonight.nvim",
  --   config = function()
  --     require("tokyonight").setup {
  --       style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  --       styles = {
  --         comments = { italic = false },
  --         keywords = { italic = false },
  --       },
  --     }
  --   end,
  -- },

  {
    "nvim-tree/nvim-tree.lua",
    event = "VeryLazy",
    config = function()
      require("nvim-tree").setup {
        view = {
          relativenumber = true,
          adaptive_size = true,
          side = "right",
        },
        diagnostics = {
          enable = true,
        },
        git = {
          ignore = false,
        },
      }
    end,
  },

  {
    "nvim-tree/nvim-web-devicons",
    opts = {},
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require "plugins.configs.treesitter"
    end,
  },

  {
    "akinsho/bufferline.nvim",
    event = "BufReadPre",
    opts = require "plugins.configs.bufferline",
  },

  {
    "echasnovski/mini.statusline",
    config = function()
      require("mini.statusline").setup { set_vim_settings = false }
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      -- cmp sources
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lua",

      -- snippets
      --list of default snippets
      "rafamadriz/friendly-snippets",

      -- snippets engine
      {
        "L3MON4D3/LuaSnip",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end,
      },

      -- autopairs , autocompletes ()[] etc
      {
        "windwp/nvim-autopairs",
        config = function()
          require("nvim-autopairs").setup()

          --  cmp integration
          local cmp_autopairs = require "nvim-autopairs.completion.cmp"
          local cmp = require "cmp"
          cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
      },
    },
    opts = function()
      return require "plugins.configs.cmp"
    end,
  },

  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    cmd = { "Mason", "MasonInstall" },
    opts = {},
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "plugins.configs.lspconfig"
    end,
  },

  {
    "stevearc/conform.nvim",
    lazy = false,
    opts = require "plugins.configs.conform",
  },

  -- {
  --   "lukas-reineke/indent-blankline.nvim",
  --   event = { "BufReadPre", "BufNewFile" },
  --   config = function()
  --     require("ibl").setup {
  --       indent = { char = "│" },
  --       scope = { char = "│", highlight = "Comment" },
  --     }
  --   end,
  -- },

  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    opts = require "plugins.configs.telescope",
  },

  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show { global = false }
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },

  {
    "ggandor/leap.nvim",
    lazy = false,
    config = function()
      require("leap").add_default_mappings(true)
    end,
  },

  {
    "folke/trouble.nvim",
    opts = {
      focus = true,
      auto_close = true,
    },
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },

  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    config = function()
      require("crates").setup()
    end,
  },

  {
    "stevearc/dressing.nvim",
    lazy = false,
    opts = {},
  },

  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    lazy = false,
    ["rust-analyzer"] = {
      check = {
        allFeatures = true,
      },
    },
  },

  {
    "ojroques/nvim-bufdel",
    config = function()
      require("bufdel").setup {
        next = "tabs",
        quit = false,
      }
    end,
  },

  {
    "Exafunction/codeium.vim",
    lazy = false,
    config = function()
      vim.keymap.set("i", "<C-g>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<c-;>", function()
        return vim.fn["codeium#CycleCompletions"](1)
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<c-,>", function()
        return vim.fn["codeium#CycleCompletions"](-1)
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<c-x>", function()
        return vim.fn["codeium#Clear"]()
      end, { expr = true, silent = true })
      vim.keymap.set("n", "<leader>ce", function()
        return vim.fn["codeium#Chat"]()
      end, { expr = true, silent = true })
    end,
  },

  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
  },

  { "wakatime/vim-wakatime", lazy = false },

  {
    "rmagatti/auto-session",
    lazy = false,
    keys = {
      { "<leader>wf", "<cmd>SessionSearch<CR>", desc = "Session search" },
      { "<leader>ws", "<cmd>SessionSave<CR>", desc = "Save session" },
      { "<leader>wa", "<cmd>SessionToggleAutoSave<CR>", desc = "Toggle autosave" },
    },

    suppressed_dirs = { "~/", "/" },

    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {

      auto_restore = false,
      session_lens = {
        load_on_setup = true,
        previewer = false,
        mappings = {
          delete_session = { "i", "<C-D>" },
          alternate_session = { "i", "<C-S>" },
        },
        theme_conf = {
          border = true,
        },
      },
    },
  },

  {
    "tiagovla/scope.nvim",
    config = function()
      require("scope").setup()
    end,
  },

  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },

  {
    "max397574/better-escape.nvim",
    config = function()
      -- lua, default settings
      require("better_escape").setup {
        timeout = vim.o.timeoutlen,
        default_mappings = false,
        mappings = {
          i = {
            j = {
              j = "<Esc>",
            },
          },
          c = {
            j = {
              j = "<Esc>",
            },
          },
          t = {
            j = {},
          },
          v = {
            j = {},
          },
          s = {
            j = {},
          },
        },
      }
    end,
  },
}
