---------------------------------------
-- General Static Neovim configurations
---------------------------------------

-- line numbers
vim.opt.relativenumber = true
vim.opt.number = true

-- tabs & indents
vim.opt.tabstop = 8
vim.opt.shiftwidth = 8
vim.opt.softtabstop = 8
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true

-- line wrapping
vim.opt.wrap = false

-- cursor line
vim.opt.cursorline = true

--search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true

-- clipboard
vim.opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- misc.
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 50

-- turn off swapfile
vim.opt.swapfile = false
