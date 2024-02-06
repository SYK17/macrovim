return {
 "folke/trouble.nvim",
 opts = {
  -- your configuration comes here
  -- or leave it empty to use the default settings
 -- settings without a patched font or icons
{
    icons = false,
    fold_open = "v", -- icon used for open folds
    fold_closed = ">", -- icon used for closed folds
    indent_lines = false, -- add an indent guide below the fold icons
    signs = {
        -- icons / text used for a diagnostic
        error = "error",
        warning = "warn",
        hint = "hint",
        information = "info"
    },
    use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
        }
    },
--    The following enables trouble in telescope (global)
--    config = function()
--        local trouble = require("trouble.providers.telescope")
--        local telescope = require("telescope")
--        telescope.setup {
--            defaults = {
--                mappings = {
--                    i = { ["<c-t>"] = trouble.open_with_trouble },
--                    n = { ["<c-t>"] = trouble.open_with_trouble },
--                },
--            },
--        }
--    end,
}
