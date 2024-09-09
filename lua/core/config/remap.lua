----------------------------
-- General Neovim key remaps
----------------------------

-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

--------------------
-- General
--------------------

-- keeps cursor centered during half page jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- keeps cursor centered during search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- poor mans tabout
--vim.keymap.set("i", "jk", "<right>")

-- clear search highlights
vim.keymap.set("n", "<leader>n", ":nohl<CR>")

-- the greatest remap ever?
vim.keymap.set("v", "<leader>p", '"_dp')

-- move highlighted texts
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- cursor stays in place when using 'J'
vim.keymap.set("n", "J", "mzJ`z")

-- refactor all words in a file
vim.keymap.set("n", "<leader>a", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- better gg/G
vim.keymap.set("n", "gg", "gg0")
vim.keymap.set("n", "G", "G$")
vim.keymap.set("v", "gg", "gg0")
vim.keymap.set("v", "G", "G$")

-- makes :E force default "Explore" over "EditQuery"
vim.api.nvim_create_user_command('E', 'Explore', {force = true})

--------------------
-- Plugins
--------------------

-- Trouble
-- vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle("diagnostics") end)
-- vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
-- vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
-- vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
-- vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
-- vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)

-- Lazy (in conflict with Harpoon <leader>l)
-- vim.keymap.set('n', '<leader>l', ':Lazy<CR>', { noremap = true, silent = true })

-- Oil
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- ZenMode
vim.keymap.set('n', '<leader>\\', function()
    -- Check if ZenMode exists
    if vim.fn.exists(':ZenMode') == 2 then
        vim.cmd('ZenMode')
    else
        vim.notify('ZenMode is not available', vim.log.levels.WARN)
    end
end, { noremap = true, silent = true, desc = "Toggle ZenMode" })
