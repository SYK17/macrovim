----------------------------------
-- Lazy.nvim plug in manager setup
----------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
    { import = "core.plugins" },
    { import = "core.plugins.lsp"},
},
    {  -- Add this options table as second argument
        checker = {
            enabled = false,  -- disables auto-update checking
        },
        install = {
            missing = true,
        },
        rocks = {
            hererocks = false,
        },
    })
