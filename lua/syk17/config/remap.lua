vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

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
vim.keymap.set("i", "jk", "<right>")

-- clear search highlights
vim.keymap.set("n", "<leader>nh", ":nohl<CR>")

-- the greatest remap ever?
vim.keymap.set("v", "<leader>p", '"_dp')

-- move highlighted texts
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv") -- TODO K not working

-- cursor stays in place when using 'J'
vim.keymap.set("n", "J", "mzJ`z")

-- refactor all words in a file
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- quick tmux-sessionizer shortcut. TODO?
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")


