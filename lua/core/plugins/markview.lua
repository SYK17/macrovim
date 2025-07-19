return {
    "OXY2DEV/markview.nvim",
    lazy = false,
    priority = 1000,
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        require("markview").setup({
            experimental = {
                check_rtp_message = false,  -- Hides startup warning.
            },
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
            links = {
                enable = true,
            },
            images = {
                enable = true,

            },
            internal_links = {
                enable = true,
            },
            keymaps = {
                next_heading = "]]",
                prev_heading = "[[",

            }
        })
    end
}
