local map = vim.keymap.set

-- General mappings
map("n", "<C-s>", "<cmd>w<CR>", { desc = "Save current buffer" })
map("i", "jj", "<ESC>", { desc = "Exit insert mode" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "Copy entire file to clipboard" })

map("n", "<m-j>", "<C-w>j", { desc = "Move to window below", noremap = true, silent = true })

-- General window navigation
map("n", "<m-k>", "<C-w>k", { desc = "Move to window above", noremap = true, silent = true })
map("n", "<m-l>", "<C-w>l", { desc = "Move to window on the right", noremap = true, silent = true })
map("n", "<m-h>", "<C-w>h", { desc = "Move to window on the left", noremap = true, silent = true })

-- NvimTree
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "Open recent files" })
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "Search text in workspace" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "Show Git status" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Show open buffers" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Search in current buffer" })

-- Bufferline, cycle buffers
map("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
map("n", "<leader>x", "<cmd>BufDel<CR>", { desc = "Close current buffer" })

-- Comment.nvim
map("n", "<leader>/", "gcc", { desc = "Toggle line comment", remap = true })
map("v", "<leader>/", "gc", { desc = "Toggle selection comment", remap = true })

-- Outline plugin
map("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })

-- Multiple-cursors.nvim
-- map({ "n", "x" }, "<C-j>", "<Cmd>MultipleCursorsAddDown<CR>", { desc = "Add cursor below" })
-- map({ "n", "x" }, "<C-k>", "<Cmd>MultipleCursorsAddUp<CR>", { desc = "Add cursor above" })

map({ "n", "i", "x" }, "<C-Up>", "<Cmd>MultipleCursorsAddUp<CR>", { desc = "Add cursor above" })
map({ "n", "i", "x" }, "<C-Down>", "<Cmd>MultipleCursorsAddDown<CR>", { desc = "Add cursor below" })

map({ "n", "i" }, "<C-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>", { desc = "Add/remove cursor" })

map({ "n", "x" }, "<Leader>a", "<Cmd>MultipleCursorsAddMatches<CR>", { desc = "Add cursors to cword" })
map({ "n", "x" }, "<Leader>A", "<Cmd>MultipleCursorsAddMatchesV<CR>", { desc = "Add cursors to cword (visual)" })

map(
  { "n", "x" },
  "<Leader>d",
  "<Cmd>MultipleCursorsAddJumpNextMatch<CR>",
  { desc = "Add cursor and jump to next match" }
)
map({ "n", "x" }, "<Leader>D", "<Cmd>MultipleCursorsJumpNextMatch<CR>", { desc = "Jump to next match" })

map({ "n", "x" }, "<Leader>l", "<Cmd>MultipleCursorsLock<CR>", { desc = "Lock virtual cursors" })

-- Scope.nvim
map("n", "<leader>ta", "<cmd>tabnew<CR>", { desc = "New scope" })
map("n", "<leader>tc", "<cmd>tabclose<CR>", { desc = "Close scope" })
map("n", "<leader>tn", "<cmd>tabnext<CR>", { desc = "Next scope" })
map("n", "<leader>tp", "<cmd>tabprevious<CR>", { desc = "Previous scope" })
