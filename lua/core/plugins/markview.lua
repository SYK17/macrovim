return {
    "OXY2DEV/markview.nvim",
    lazy = false,      
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        require("markview").setup({
            -- Show table of contents
            show_toc = true,
            
            -- Enable heading folding
            fold_heading = true,
            
            -- Options specific to headings
            heading = {
                -- Enable heading numbers (e.g., 1.1, 1.2, etc.)
                numbers = true,
                
                -- Show heading markers (#, ##, etc.)
                markers = true,
                
                -- Format headings
                format = true
            },
            inline_codes = {
                enable = true,
            },
            latex = {
                enable = true,
            },
        })
    end
}
