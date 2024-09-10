return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup {
            options = {
                section_separators = { left = '', right = '' },
                component_separators = { left = '', right = '' },
                globalstatus = true,
            },
            sections = {
                -- +-------------------------------------------------+
                -- | A | B | C                             X | Y | Z |
                -- +-------------------------------------------------+
                lualine_a = {'mode'},
                lualine_b = {'branch', 'diff', 'diagnostics'},
                lualine_c = {'filename'},
                lualine_x = {'encoding', 'fileformat', 'filetype'},
                lualine_y = {'progress'},
                lualine_z = {'location'}
            },
        }
    end
}

