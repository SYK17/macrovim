vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

--------------------
-- General
--------------------

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Center cursor as you scroll" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Center cursor as you scroll" })
vim.keymap.set("i", "jk", "<right>", { desc = "Tabout" })

-- clear search highlights
vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
