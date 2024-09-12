return{
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local default_conf = {
            enable = true,
            style = {},
            notify = false,
            priority = 0,
            delay = 0,
            error_sign = true,
            exclude_filetypes = {
                aerial = true,
                dashboard = true,
                -- some other filetypes
            },
        }
        require("hlchunk").setup({
            chunk = {
                enable = true
            },
        })
    end
}
