return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = {
        'nvim-tree/nvim-web-devicons'
    },
    config = function()
        require("bufferline").setup {
            options = {
                numbers = "buffer_id",
                diagnostics = "nvim_lsp",
                -- Other options...
            },
        }
    end,
}

