-- line numbers
vim.opt.relativenumber = true
vim.opt.number = true

-- tabs & indents
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true

-- line wrapping
vim.opt.wrap = false

--search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- clipboard
vim.opt.clipboard:append("unnamedplus") -- use system clipboard as default register
