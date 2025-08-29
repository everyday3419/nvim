return {
  { lazy = true, "nvim-lua/plenary.nvim" },

  {
    "echasnovski/mini.splitjoin",
    version = false,
    config = function()
      require("mini.splitjoin").setup {}
    end,
  },

  {
    "echasnovski/mini.bufremove",
    version = false,
  },

  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      keymap = {
        fzf = {
          ["ctrl-q"] = "select-all+accept",
        },
      },

      buffers = {
        winopts = {
          preview = { hidden = true },
        },
      },
    },
  },

  {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
      local mini_files = require "mini.files"
      mini_files.setup {}

      local function map_split(buf_id, lhs, direction)
        local function rhs()
          local window = mini_files.get_explorer_state().target_window

          if window == nil or mini_files.get_fs_entry().fs_type == "directory" then
            return
          end

          local new_target_window
          vim.api.nvim_win_call(window, function()
            vim.cmd(direction .. " split")
            new_target_window = vim.api.nvim_get_current_win()
          end)

          mini_files.set_target_window(new_target_window)
          mini_files.go_in { close_on_file = true }
        end

        vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = "Split " .. direction })
      end

      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniFilesBufferCreate",
        callback = function(args)
          local buf_id = args.data.buf_id
          map_split(buf_id, "<C-w>s", "belowright horizontal")
          map_split(buf_id, "<C-w>v", "belowright vertical")
        end,
      })
    end,
  },

  {
    "sindrets/diffview.nvim",
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
  --   "chriskempson/base16-vim",
  --   config = function()
  --     vim.cmd "colorscheme base16-default-dark"
  --   end,
  -- },

  {
    "lunarvim/darkplus.nvim",
    config = function()
      vim.cmd "colorscheme darkplus"
    end,
  },

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

  -- {
  --   "cdmill/neomodern.nvim",
  --   priority = 1000,
  --   config = function()
  --     require("neomodern").setup {
  --       theme = "gyokuro",
  --       transparent = true,
  --     }
  --     require("neomodern").load()
  --     for _, group in ipairs(vim.fn.getcompletion("", "highlight")) do
  --       local hl = vim.api.nvim_get_hl(0, { name = group })
  --       if hl.italic then
  --         hl.italic = false
  --         vim.api.nvim_set_hl(0, group, hl)
  --       end
  --     end
  --   end,
  -- },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
  -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },

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

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup {
        options = {
          icons_enabled = true,
          component_separators = "|",
          section_separators = "",
        },
        sections = {
          lualine_a = {
            {
              "mode",
              fmt = function(res)
                return res:sub(1, 1)
              end,
            },
          },
          lualine_b = { "branch", "diagnostics" },
          lualine_c = { "filename" },
          lualine_x = {},
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      }
    end,
  },

  -- {
  --   "nvim-tree/nvim-tree.lua",
  --   cmd = { "NvimTreeToggle", "NvimTreeFocus" },
  --   opts = {},
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
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = {
      auto_close = true,
      focus = true,
    },
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
  --           accept = "<C-g>",
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

      "ibhagwan/fzf-lua",
      "echasnovski/mini.pick",
    },
    config = true,
  },

  -- TODO: migrate to fzf
  -- {
  --   "gbprod/yanky.nvim",
  --   dependencies = {
  --     { "kkharji/sqlite.lua" },
  --   },
  --   opts = {
  --     ring = { storage = "sqlite" },
  --   },
  --   keys = {
  --     {
  --       "<leader>p",
  --       function()
  --         require("telescope").extensions.yank_history.yank_history {}
  --       end,
  --       desc = "Open Yank History",
  --     },
  --     {
  --       "y",
  --       "<Plug>(YankyYank)",
  --       mode = { "n", "x" },
  --       desc = "Yank text",
  --     },
  --     {
  --       "p",
  --       "<Plug>(YankyPutAfter)",
  --       mode = { "n", "x" },
  --       desc = "Put yanked text after cursor",
  --     },
  --     {
  --       "P",
  --       "<Plug>(YankyPutBefore)",
  --       mode = { "n", "x" },
  --       desc = "Put yanked text before cursor",
  --     },
  --     {
  --       "gp",
  --       "<Plug>(YankyGPutAfter)",
  --       mode = { "n", "x" },
  --       desc = "Put yanked text after selection",
  --     },
  --     {
  --       "gP",
  --       "<Plug>(YankyGPutBefore)",
  --       mode = { "n", "x" },
  --       desc = "Put yanked text before selection",
  --     },
  --     { "<c-p>", "<Plug>(YankyPreviousEntry)", desc = "Select previous entry through yank history" },
  --     { "<c-n>", "<Plug>(YankyNextEntry)", desc = "Select next entry through yank history" },
  --     { "]p", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put indented after cursor (linewise)" },
  --     { "[p", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put indented before cursor (linewise)" },
  --     { "]P", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put indented after cursor (linewise)" },
  --     { "[P", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put indented before cursor (linewise)" },
  --     { ">p", "<Plug>(YankyPutIndentAfterShiftRight)", desc = "Put and indent right" },
  --     { "<p", "<Plug>(YankyPutIndentAfterShiftLeft)", desc = "Put and indent left" },
  --     { ">P", "<Plug>(YankyPutIndentBeforeShiftRight)", desc = "Put before and indent right" },
  --     { "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)", desc = "Put before and indent left" },
  --     { "=p", "<Plug>(YankyPutAfterFilter)", desc = "Put after applying a filter" },
  --     { "=P", "<Plug>(YankyPutBeforeFilter)", desc = "Put before applying a filter" },
  --   },
  -- },

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

  {
    "mbbill/undotree",
    keys = {
      {
        "<leader>u",
        function()
          vim.cmd.UndotreeToggle()
          vim.cmd "wincmd t"
        end,
      },
    },
  },

  -- {
  --   "Bekaboo/dropbar.nvim",
  --   -- optional, but required for fuzzy finder support
  --   dependencies = {
  --     "nvim-telescope/telescope-fzf-native.nvim",
  --     build = "make",
  --   },
  --   config = function()
  --     local dropbar_api = require "dropbar.api"
  --     vim.keymap.set("n", "<Leader>;", dropbar_api.pick, { desc = "Pick symbols in winbar" })
  --     vim.keymap.set("n", "[;", dropbar_api.goto_context_start, { desc = "Go to start of current context" })
  --     vim.keymap.set("n", "];", dropbar_api.select_next_context, { desc = "Select next context" })
  --   end,
  -- },

  -- {
  --   "akinsho/bufferline.nvim",
  --   version = "*",
  --   dependencies = "nvim-tree/nvim-web-devicons",
  --   config = function()
  --     vim.opt.termguicolors = true
  --     require("bufferline").setup {}
  --   end,
  -- },
}
