return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- 1. Use the new vim.lsp.config instead of require('lspconfig').setup
            vim.lsp.config('sourcekit', {
                capabilities = {
                    workspace = {
                        didChangeWatchedFiles = {
                            dynamicRegistration = true,
                        },
                    },
                },
            })

            -- 2. Explicitly enable the server
            vim.lsp.enable('sourcekit')

            -- 3. Keybindings (added local 'opts' to prevent errors)
            vim.api.nvim_create_autocmd('LspAttach', {
                desc = 'LSP Actions',
                callback = function(args)
                    local opts = { buffer = args.buf, noremap = true, silent = true }

                    vim.keymap.set('n', '<leader>d', function() vim.diagnostic.open_float() end, opts)
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                    vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev() end, opts)
                    vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next() end, opts)
                end,
            })
        end,
    }
}
