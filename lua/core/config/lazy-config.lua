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
    { import = "core.plugins.dap"},
    {
        "nvim-lua/plenary.nvim",
        "echasnovski/mini.nvim",
        config = function()
            require("mini.starter").setup({
                -- Configure mini.starter here (optional)
                content = {
                    { "Neovim :: [MACRO]", "Normal" },
                    { " - Editing made simple", "NonText" },
                    { "Copyright (c) 2024 - [MACRO] developers", "NonText" },
                },
            })
        end,
    },
})
