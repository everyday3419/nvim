local o = vim.o

vim.g.mapleader = " "

o.laststatus = 3 -- global statusline
o.showmode = false

o.clipboard = "unnamedplus"

o.nu = true

-- Indenting
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2

vim.opt.fillchars = { eob = " " }
o.ignorecase = true
o.smartcase = true
o.mouse = "a"

o.wrap = false

-- Numbers
o.number = true
o.relativenumber = true

o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.termguicolors = true
o.timeoutlen = 400
o.undofile = true
o.cursorline = true

o.scrolloff = 6
o.sidescrolloff = 6

-- Spell
o.spelllang = "en"
o.spell = true

vim.g.border_style = "rounded" ---@type "single"|"double"|"rounded"
-- vim.opt.laststatus = 0
vim.api.nvim_set_hl(0, "IndentLine", { link = "Comment" })

o.guicursor = "n-v-c:block,i:block"

vim.o.cursorline = false

-- add binaries installed by mason.nvim to path
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
vim.env.PATH = vim.env.PATH .. (is_windows and ";" or ":") .. vim.fn.stdpath "data" .. "/mason/bin"

-- vim.o.laststatus = 0

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    local groups = {
      "Normal",
      "NormalNC",
      "NormalFloat",
      "FloatBorder",
      "SignColumn",
      "VertSplit",
      "StatusLine",
      "StatusLineNC",
      "WinBar",
      "WinBarNC",
      "TabLine",
      "TabLineFill",
      "TabLineSel",
      "MsgArea",
      "Cmdline",
    }
    for _, group in ipairs(groups) do
      vim.api.nvim_set_hl(0, group, { bg = "none" })
    end
  end,
})
