return {
    {   'kdheepak/monochrome.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd ([[colorscheme monochrome]])
        end,
            },
    {
        'SYK17/candle-grey',
        lazy = true,
        config = function()
            vim.cmd([[colorscheme candle-grey-transparent]])
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
