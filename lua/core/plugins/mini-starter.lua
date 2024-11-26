return {
    'echasnovski/mini.starter',
    version = '*',
    config = function()
        local starter = require('mini.starter')

        starter.setup({
            -- Content shown at the start screen
            items = {
                starter.sections.builtin_actions(),
                starter.sections.recent_files(10, true),  -- Shows 10 recent files
                -- starter.sections.sessions(5, true),       -- Shows 5 sessions
            },

            -- Custom header
            header = [[
Neovim  ::  M Λ C R O
Editing made simple

Copyright (c) 2024 - M Λ C R O developers
]],


            -- Footer (optional, remove if not needed)
            footer = function()
                return "“A small but persistent discipline is a great force; for a soft drop falling persistently, hollows out hard rock.”"
            end,

            -- Use a clean, centered layout
            content_hooks = {
                starter.gen_hook.adding_bullet("» "), -- Bullet before each item
                starter.gen_hook.aligning("center", "center"), -- Align header and items in center
                -- starter.gen_hook.padding(10),
            },
        })
    end
}
