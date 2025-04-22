return {
  { lazy = true, "nvim-lua/plenary.nvim" },

  {
    "echasnovski/mini.bufremove",
    version = false,
  },

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

  {
    "catppuccin/nvim",
    config = function()
      require("catppuccin").setup {
        flavour = "mocha",
        no_italic = true,
        no_bold = false,
        transparent_background = true,
        -- color_overrides = {
        --   mocha = {
        --     base = "#000000",
        --     mantle = "#000000",
        --     crust = "#000000",
        --   },
        -- },
      }

      vim.cmd.colorscheme "catppuccin"

      vim.o.cursorline = false
    end,
  },

  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      local fb_actions = require("telescope").extensions.file_browser.actions
      require("telescope").setup {
        extensions = {
          file_browser = {
            theme = "ivy",
            hijack_netrw = true,
            grouped = true,
            hidden = { file_browser = true, folder_browser = true },
            dir_icon = "",
            previewer = false,
            initial_mode = "normal",
            mappings = {
              ["i"] = {
                ["<C-o>"] = require("telescope.actions").select_default,
              },
              ["n"] = {
                ["o"] = require("telescope.actions").select_default,
                ["<bs>"] = fb_actions.backspace,
                ["<m-c>"] = fb_actions.create,
                ["<m-r>"] = fb_actions.rename,
                ["<m-d>"] = fb_actions.remove,
                ["<m-y>"] = fb_actions.copy,
                ["<m-m>"] = fb_actions.move,
              },
            },
          },
        },
      }
      require("telescope").load_extension "file_browser"

      vim.keymap.set("n", "<leader>e", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")

      -- vim.keymap.set("n", "<leader>e", function()
      --   require("telescope").extensions.file_browser.file_browser()
      -- end)
    end,
  },

  -- {
  --   "nvim-tree/nvim-tree.lua",
  --   event = "VeryLazy",
  --   config = function()
  --     local HEIGHT_RATIO = 0.8 -- You can change this
  --     local WIDTH_RATIO = 0.5 -- You can change this too
  --     require("nvim-tree").setup {
  --       view = {
  --         relativenumber = true,
  --         adaptive_size = true,
  --         float = {
  --           enable = true,
  --           open_win_config = function()
  --             local screen_w = vim.opt.columns:get()
  --             local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
  --             local window_w = screen_w * WIDTH_RATIO
  --             local window_h = screen_h * HEIGHT_RATIO
  --             local window_w_int = math.floor(window_w)
  --             local window_h_int = math.floor(window_h)
  --             local center_x = (screen_w - window_w) / 2
  --             local center_y = ((vim.opt.lines:get() - window_h) / 2 - vim.opt.cmdheight:get())
  --             return {
  --               border = "rounded",
  --               relative = "editor",
  --               row = center_y,
  --               col = center_x,
  --               width = window_w_int,
  --               height = window_h_int,
  --             }
  --           end,
  --         },
  --         width = function()
  --           return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
  --         end,
  --       },
  --       diagnostics = {
  --         enable = true,
  --       },
  --       git = {
  --         ignore = false,
  --       },
  --     }
  --   end,
  -- },

  {
    "nvim-tree/nvim-web-devicons",
    opts = {},
  },

  -- {
  --   "echasnovski/mini.statusline",
  --   config = function()
  --     require("mini.statusline").setup { set_vim_settings = false }
  --   end,
  -- },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require "plugins.configs.treesitter"
    end,
  },

  -- {
  --   "nvim-lualine/lualine.nvim",
  --   dependencies = { "nvim-tree/nvim-web-devicons" },
  --   config = function()
  --     require("lualine").setup {
  --       options = {
  --         icons_enabled = true,
  --         component_separators = "|",
  --         section_separators = "",
  --       },
  --       sections = {
  --         lualine_a = {
  --           {
  --             "mode",
  --             fmt = function(res)
  --               return res:sub(1, 1)
  --             end,
  --           },
  --         },
  --         lualine_b = { "diagnostics" },
  --         lualine_c = { "filename" },
  --         lualine_x = {},
  --         lualine_y = { "progress" },
  --         lualine_z = { "location" },
  --       },
  --     }
  --   end,
  -- },

  {
    "saghen/blink.cmp",
    version = "1.*",
    event = "InsertEnter",
    dependencies = {
      "rafamadriz/friendly-snippets",

      {
        "L3MON4D3/LuaSnip",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end,
      },

      { "windwp/nvim-autopairs", opts = {} },
    },

    opts = function()
      return require "plugins.configs.blink"
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
    opts = {
      preset = "helix",
      spec = {
        { "<leader>g", group = "Git" },
        { "<leader>c", group = "LSP" },
        { "<leader>w", group = "Windows" },
      },
      icons = {
        rules = false,
      },
    },
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
    tag = "stable",
    config = function()
      require("crates").setup()
    end,
  },

  {
    "stevearc/dressing.nvim",
    lazy = false,
    opts = {},
  },

  -- {
  --   "Exafunction/codeium.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     -- "hrsh7th/nvim-cmp",
  --   },
  --   config = function()
  --     require("codeium").setup {
  --       -- Optionally disable cmp source if using virtual text only
  --       enable_cmp_source = false,
  --       virtual_text = {
  --         enabled = true,
  --
  --         -- These are the defaults
  --
  --         -- Set to true if you never want completions to be shown automatically.
  --         manual = false,
  --         -- A mapping of filetype to true or false, to enable virtual text.
  --         filetypes = {},
  --         -- Whether to enable virtual text of not for filetypes not specifically listed above.
  --         default_filetype_enabled = true,
  --         -- How long to wait (in ms) before requesting completions after typing stops.
  --         idle_delay = 75,
  --         -- Priority of the virtual text. This usually ensures that the completions appear on top of
  --         -- other plugins that also add virtual text, such as LSP inlay hints, but can be modified if
  --         -- desired.
  --         virtual_text_priority = 65535,
  --         -- Set to false to disable all key bindings for managing completions.
  --         map_keys = true,
  --         -- The key to press when hitting the accept keybinding but no completion is showing.
  --         -- Defaults to \t normally or <c-n> when a popup is showing.
  --         accept_fallback = nil,
  --         -- Key bindings for managing completions in virtual text mode.
  --         key_bindings = {
  --           -- Accept the current completion.
  --           accept = "<Tab>",
  --           -- Accept the next word.
  --           accept_word = false,
  --           -- Accept the next line.
  --           accept_line = false,
  --           -- Clear the virtual text.
  --           clear = false,
  --           -- Cycle to the next completion.
  --           next = "<M-]>",
  --           -- Cycle to the previous completion.
  --           prev = "<M-[>",
  --         },
  --       },
  --     }
  --   end,
  -- },

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
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",

      "nvim-telescope/telescope.nvim",
      "ibhagwan/fzf-lua",
      "echasnovski/mini.pick",
    },
    config = true,
  },

  {
    "gbprod/yanky.nvim",
    dependencies = {
      { "kkharji/sqlite.lua" },
    },
    opts = {
      ring = { storage = "sqlite" },
    },
    keys = {
      {
        "<leader>p",
        function()
          require("telescope").extensions.yank_history.yank_history {}
        end,
        desc = "Open Yank History",
      },
      {
        "y",
        "<Plug>(YankyYank)",
        mode = { "n", "x" },
        desc = "Yank text",
      },
      {
        "p",
        "<Plug>(YankyPutAfter)",
        mode = { "n", "x" },
        desc = "Put yanked text after cursor",
      },
      {
        "P",
        "<Plug>(YankyPutBefore)",
        mode = { "n", "x" },
        desc = "Put yanked text before cursor",
      },
      {
        "gp",
        "<Plug>(YankyGPutAfter)",
        mode = { "n", "x" },
        desc = "Put yanked text after selection",
      },
      {
        "gP",
        "<Plug>(YankyGPutBefore)",
        mode = { "n", "x" },
        desc = "Put yanked text before selection",
      },
      { "<c-p>", "<Plug>(YankyPreviousEntry)", desc = "Select previous entry through yank history" },
      { "<c-n>", "<Plug>(YankyNextEntry)", desc = "Select next entry through yank history" },
      { "]p", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put indented after cursor (linewise)" },
      { "[p", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put indented before cursor (linewise)" },
      { "]P", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put indented after cursor (linewise)" },
      { "[P", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put indented before cursor (linewise)" },
      { ">p", "<Plug>(YankyPutIndentAfterShiftRight)", desc = "Put and indent right" },
      { "<p", "<Plug>(YankyPutIndentAfterShiftLeft)", desc = "Put and indent left" },
      { ">P", "<Plug>(YankyPutIndentBeforeShiftRight)", desc = "Put before and indent right" },
      { "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)", desc = "Put before and indent left" },
      { "=p", "<Plug>(YankyPutAfterFilter)", desc = "Put after applying a filter" },
      { "=P", "<Plug>(YankyPutBeforeFilter)", desc = "Put before applying a filter" },
    },
  },

  {
    "mrcjkb/rustaceanvim",
    version = "^5", -- Recommended
    lazy = false, -- This plugin is already lazy
  },

  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },

  {
    "hedyhli/outline.nvim",
    config = function()
      -- Example mapping to toggle outline
      vim.keymap.set("n", "<leader>co", "<cmd>Outline<CR>", { desc = "Toggle Outline" })

      require("outline").setup {}
    end,
  },
}
