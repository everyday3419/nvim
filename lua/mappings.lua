local map = vim.keymap.set

map("n", "<C-s>", "<cmd>w<CR>", { desc = "Save current buffer" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "Copy entire file to clipboard" })

map("n", "<m-j>", "<C-w>j", { desc = "Move to window below", noremap = true, silent = true })
map("n", "<Esc><Esc>", "<cmd>nohlsearch<CR>")

map("n", "<m-k>", "<C-w>k", { desc = "Move to window above", noremap = true, silent = true })
map("n", "<m-l>", "<C-w>l", { desc = "Move to window on the right", noremap = true, silent = true })
map("n", "<m-h>", "<C-w>h", { desc = "Move to window on the left", noremap = true, silent = true })

map("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<S-Tab>", "<cmd>bprev<CR>", { desc = "Previous buffer" })
map("n", "<m-x>", "<cmd>:q<CR>", { desc = "Close current buffer" })

map("n", "<leader>/", "gcc", { desc = "Toggle line comment", remap = true })
map("v", "<leader>/", "gc", { desc = "Toggle selection comment", remap = true })
