local map = vim.keymap.set

-- General mappings
map("n", "<C-s>", "<cmd>w<CR>", { desc = "Save current buffer" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "Copy entire file to clipboard" })

map("n", "<m-j>", "<C-w>j", { desc = "Move to window below", noremap = true, silent = true })
map("n", "<Esc><Esc>", "<cmd>nohlsearch<CR>")

-- General window navigation
map("n", "<m-k>", "<C-w>k", { desc = "Move to window above", noremap = true, silent = true })
map("n", "<m-l>", "<C-w>l", { desc = "Move to window on the right", noremap = true, silent = true })
map("n", "<m-h>", "<C-w>h", { desc = "Move to window on the left", noremap = true, silent = true })

-- MiniFiles
local minifiles_toggle = function(...)
  if not MiniFiles.close() then
    MiniFiles.open(...)
  end
end
map("n", "<leader>e", minifiles_toggle, { desc = "Toggle file explorer" })

-- Telescope
map("n", "<leader>f", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>o", "<cmd>Telescope oldfiles<CR>", { desc = "Open recent files" })
map("n", "<leader>'", "<cmd>Telescope live_grep<CR>", { desc = "Search text in workspace" })
map("n", "<leader>b", "<cmd>Telescope buffers<CR>", { desc = "Show open buffers" })
map(
  "n",
  "<leader>z",
  "<cmd>Telescope current_buffer_fuzzy_find previewer=true<CR>",
  { desc = "Search in current buffer with preview" }
)
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Show code actions" })

-- Bufferline, cycle buffers
map("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<S-Tab>", "<cmd>bprev<CR>", { desc = "Previous buffer" })
map("n", "<m-x>", "<cmd>:q<CR>", { desc = "Close current buffer" })

-- Comment.nvim
map("n", "<leader>/", "gcc", { desc = "Toggle line comment", remap = true })
map("v", "<leader>/", "gc", { desc = "Toggle selection comment", remap = true })

-- Neogit
map("n", "<leader>gg", "<cmd>Neogit<CR>", { desc = "Open Neogit" })

-- mini
map("n", "<leader>x", function()
  require("mini.bufremove").delete()
end, { desc = "Close current buffer" })
