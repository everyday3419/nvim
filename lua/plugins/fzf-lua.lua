return {
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
  config = function()
    local map = vim.keymap.set
    map("n", "<leader>f", "<cmd>FzfLua files<CR>", { desc = "Find files" })
    map("n", "<leader>o", "<cmd>FzfLua oldfiles<CR>", { desc = "Open recent files" })
    map("n", "<leader>'", "<cmd>FzfLua live_grep<CR>", { desc = "Search text in workspace" })
    map("n", "<leader>b", "<cmd>FzfLua buffers<CR>", { desc = "Show open buffers" })
    map("n", "<leader>z", function()
      require("fzf-lua").blines {
        winopts = {
          treesitter = {
            enabled = false,
            fzf_colors = {
              ["fg"] = { "fg", "CursorLine" },
              ["bg"] = { "bg", "Normal" },
            },
          },
        },
        fzf_opts = {
          ["--layout"] = "reverse",
        },
      }
    end, { desc = "Search in current buffer with preview" })
    map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Show code actions" })
  end,
}
