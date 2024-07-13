---------------------------------------------------------------------------------------------------------------------------
-- The entry point for Neovim configuration. Typically used to set up basic operations and load other configuration files.
---------------------------------------------------------------------------------------------------------------------------

vim.g.mapleader = " "

require("core.config.remap")
require("core.config.options")
require("core.config.lazy-config")
require("core.plugins.treesitter")

-- Set the Python 3 host program for Neovim
vim.g.python3_host_prog = '/opt/homebrew/bin/python3'
