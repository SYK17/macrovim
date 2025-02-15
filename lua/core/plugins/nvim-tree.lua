return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = true,
    cmd = { "NvimTreeToggle" },
    -- dependencies = {
    --     "nvim-tree/nvim-web-devicons",
    -- },
    config = function()
        require("nvim-tree").setup {
            sort_by = "case_sensitive",
            view = {
                width = 25,
            },
            renderer = {
                group_empty = true,
            },
            filters = {
                dotfiles = true,
            },
        }

        -- Set up the keybinding for <leader>e
        vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
    end,
}
