vim.g.mapleader = " "

require("syk17.config.remap")
require("syk17.config.options")
require("syk17.lazy-config")
require("syk17.plugins.nvim-treesitter")

-- Set the Python 3 host program for Neovim
vim.g.python3_host_prog = '/opt/homebrew/bin/python3'
