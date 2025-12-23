return {
        {
                "nvim-treesitter/nvim-treesitter",
                priority = 900,
                event = { "BufReadPre", "BufNewFile" },
                build = ":TSUpdate",
                config = function()
                        require("nvim-treesitter.configs").setup({
                                highlight = { enable = true },
                                indent = { enable = true },
                                autotag = { enable = true },
                                ensure_installed = {
                                        "json",
                                        "javascript",
                                        "html",
                                        "css",
                                        "markdown",
                                        "markdown_inline",
                                        "lua",
                                        "vim",
                                        "python",
                                        "go",
                                },
                        })
                end,
        },
}
