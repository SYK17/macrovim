return {
    {   'SYK17/candle-grey',
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme candle-grey]])
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
        'jaredgorski/fogbell.vim',
        lazy = true,
        config = function()
            vim.cmd([[colorscheme fogbell]])
        end,
    },
    {
        'andreasvc/vim-256noir',
        lazy = true,
        config = function()
            vim.cmd([[colorscheme 256_noir]])
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
