----------------------------------------------------------------------------------------------------------------------------------
-- The entry point for Neovim configuration. Typically used to set up basic operations and load other configuration files.
----------------------------------------------------------------------------------------------------------------------------------

vim.g.mapleader = " "
vim.opt.termguicolors = true

require("core.config.remap")
require("core.config.options")
require("core.config.lazy-config")
require("core.config.autocmds")
require('core.config.markdown-to-pdf')
require("core.plugins.treesitter")
require("core.plugins.mini-starter")

-- Set the Python 3 host program for Neovim
vim.g.python3_host_prog = '/opt/homebrew/bin/python3'
