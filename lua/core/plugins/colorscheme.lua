return {
    {
        'logico/typewriter',
        lazy = false,
        config = function()
            vim.cmd([[colorscheme typewriter]])
        end,
    },
    {   'rebelot/kanagawa.nvim',
        lazy = false,
        config = function()
            vim.cmd([[colorscheme kanagawa-dragon]])
        end,
    },
    {	'yorickpeterse/nvim-grey',
        lazy = false,
        config = function()
            vim.cmd([[colorscheme grey]])
        end,
    },
    {	'andreasvc/vim-256noir',
        lazy = false,
        config = function()
            vim.cmd([[colorscheme 256_noir]])
        end,
    },
    {
        'kdheepak/monochrome.nvim',
        lazy = false,
        config = function()
            vim.cmd([[colorscheme monochrome]])
        end,
    },
    {
        'SYK17/candle-grey',
        lazy = false,
        config = function()
            vim.cmd([[colorscheme candle-grey-transparent]])
        end,
    },
    {
        'SYK17/Mies.vim',
        lazy = false,
        config = function()
            vim.cmd([[colorscheme mies]])
        end,
    },
    {	'SYK17/rams.vim',
        lazy = false,
        config = function()
            vim.cmd.colorscheme("rams")
        end,
    },
    {
        "p00f/alabaster.nvim",
        config = function()
            vim.cmd([[colorscheme alabaster]])
        end,
    },
    {
        'projekt0n/github-nvim-theme',
        name = 'github-theme',
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        config = function()
            require('github-theme').setup({
                -- ...
            })

            vim.cmd('colorscheme github_dark')
        end,
    },
}
