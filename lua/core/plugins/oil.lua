return {
    'stevearc/oil.nvim',
    opts = function()
        local oil = require('oil')
        local icons = require('utils.static').icons -- You may need to adjust this path
        local icon_file = vim.trim(icons.File)
        local icon_dir = vim.trim(icons.Folder)

        local permission_hlgroups = setmetatable({
            ['-'] = 'OilPermissionNone',
            ['r'] = 'OilPermissionRead',
            ['w'] = 'OilPermissionWrite',
            ['x'] = 'OilPermissionExecute',
        }, {
            __index = function()
                return 'OilDir'
            end,
        })

        local type_hlgroups = setmetatable({
            ['-'] = 'OilTypeFile',
            ['d'] = 'OilTypeDir',
            ['p'] = 'OilTypeFifo',
            ['l'] = 'OilTypeLink',
            ['s'] = 'OilTypeSocket',
        }, {
            __index = function()
                return 'OilTypeFile'
            end,
        })

        local border = vim.g.modern_ui and 'solid' or 'single'

        -- Define the preview_mapping (you can adjust this as needed)
        local preview_mapping = {
            mode = { 'n', 'x' },
            desc = 'Toggle preview',
            callback = function()
                -- Implement your preview toggle functionality here
                print("Preview toggle functionality not implemented")
            end,
        }

        return {
            columns = {
                {
                    'type',
                    icons = {
                        directory = 'd',
                        fifo = 'p',
                        file = '-',
                        link = 'l',
                        socket = 's',
                    },
                    highlight = function(type_str)
                        return type_hlgroups[type_str]
                    end,
                    add_padding = true,
                },
                {
                    'permissions',
                    highlight = function(permission_str)
                        local hls = {}
                        for i = 1, #permission_str do
                            local char = permission_str:sub(i, i)
                            table.insert(hls, { permission_hlgroups[char], i - 1, i })
                        end
                        return hls
                    end,
                    add_padding = true,
                },
                { 'size', highlight = 'Special', add_padding = true },
                { 'mtime', highlight = 'Number', add_padding = true },
                {
                    'icon',
                    default_file = icon_file,
                    directory = icon_dir,
                    add_padding = true,
                },
            },
            default_file_explorer = true,
            buf_options = {
                buflisted = false,
                bufhidden = "hide",
            },
            win_options = {
                number = false,
                relativenumber = false,
                signcolumn = "no",
                foldcolumn = "0",
                statuscolumn = '',
                wrap = false,
                spell = false,
                list = false,
                conceallevel = 3,
                concealcursor = "nvic",
            },
            delete_to_trash = true,
            skip_confirm_for_simple_edits = true,
            prompt_save_on_select_new_entry = true,
            cleanup_delay_ms = false,
            lsp_file_methods = {
                timeout_ms = 1000,
                autosave_changes = false,
            },
            constrain_cursor = "editable",
            use_default_keymaps = false,
            view_options = {
                show_hidden = true,
                is_hidden_file = function(name, bufnr)
                    return vim.startswith(name, ".")
                end,
                is_always_hidden = function(name)
                    return name == '..'
                end,
                natural_order = true,
                case_insensitive = false,
                sort = {
                    { "type", "asc" },
                    { "name", "asc" },
                },
            },
            keymaps = {
                ['g?'] = 'actions.show_help',
                ['K'] = preview_mapping,
                ['<C-k>'] = preview_mapping,
                ['-'] = 'actions.parent',
                ['='] = 'actions.select',
                ['<CR>'] = 'actions.select',
                ['<C-h>'] = 'actions.toggle_hidden',
                ['gh'] = 'actions.toggle_hidden',
                ['gs'] = 'actions.change_sort',
                ['gx'] = 'actions.open_external',
                ['gY'] = 'actions.copy_entry_filename',
                ['go'] = {
                    mode = 'n',
                    buffer = true,
                    desc = 'Choose an external program to open the entry under the cursor',
                    callback = function()
                        local entry = oil.get_cursor_entry()
                        local dir = oil.get_current_dir()
                        if not entry or not dir then
                            return
                        end
                        local entry_path = vim.fs.joinpath(dir, entry.name)
                        local response
                        vim.ui.input({
                            prompt = 'Open with: ',
                            completion = 'shellcmd',
                        }, function(r)
                            response = r
                        end)
                        if not response then
                            return
                        end
                        print('\n')
                        vim.system({ response, entry_path })
                    end,
                },
                ['gy'] = {
                    mode = 'n',
                    buffer = true,
                    desc = 'Yank the filepath of the entry under the cursor to a register',
                    callback = function()
                        local entry = oil.get_cursor_entry()
                        local dir = oil.get_current_dir()
                        if not entry or not dir then
                            return
                        end
                        local entry_path = vim.fs.joinpath(dir, entry.name)
                        vim.fn.setreg('"', entry_path)
                        vim.fn.setreg(vim.v.register, entry_path)
                        vim.notify(
                            string.format(
                                "[oil] yanked '%s' to register '%s'",
                                entry_path,
                                vim.v.register
                            )
                        )
                    end,
                },
            },
            float = {
                padding = 2,
                max_width = 0.9,
                max_height = 0.9,
                border = border,
                win_options = {
                    winblend = 0,
                },
            },
            preview = {
                max_width = 0.9,
                min_width = { 40, 0.4 },
                max_height = 0.9,
                min_height = { 5, 0.1 },
                border = border,
                win_options = {
                    winblend = 0,
                },
            },
            progress = {
                border = border,
                win_options = {
                    winblend = 0,
                },
            },
            ssh = {
                border = border,
            },
            keymaps_help = {
                border = border,
            },
        }
    end,
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
}
