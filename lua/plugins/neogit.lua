return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",

    "ibhagwan/fzf-lua",
    "echasnovski/mini.pick",
  },
  config = true,
  keys = {
    { "<leader>gg", ":Neogit<cr>", desc = "Neogit" },
    {
      "<leader>gf",
      function()
        require("neogit").action("log", "log_current", { "--", vim.fn.expand "%" })()
      end,
      desc = "Git log for file",
    },
  },
}
