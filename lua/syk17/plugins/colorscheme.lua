return {
    {   'rebelot/kanagawa.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme kanagawa-dragon]])
        end,
    },
    {   'yorickpeterse/nvim-grey',
        lazy = true,
        config = function()
            vim.cmd([[colorscheme grey]])
        end,
    },    {   'andreasvc/vim-256noir',
        lazy = true,
        config = function()
            vim.cmd([[colorscheme 256_noir]])
        end,
    },
    {
        'kdheepak/monochrome.nvim',
        lazy = true,
        config = function()
            vim.cmd([[colorscheme monochrome]])
        end,
    },
    {
        'SYK17/candle-grey',
        lazy = true,
        config = function()
            vim.cmd([[colorscheme candle-grey]])
        end,
    },
    {
        'SYK17/Mies.vim',
        lazy = true,
        config = function()
            vim.cmd([[colorscheme mies]])
        end,
    },
    {   'SYK17/rams.vim',
        lazy = true,
        config = function()
            vim.cmd([[colorscheme rams]])
        end,
    },
}
