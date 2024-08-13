--------------------------------
-- Dynamic Neovim Configurations
--------------------------------

--  Absolute line number in insert
vim.api.nvim_create_autocmd("InsertEnter", {
    callback = function()
        vim.opt.relativenumber = false
    end,
})

-- Relative line number in normal
vim.api.nvim_create_autocmd("InsertLeave", {
    callback = function()
        vim.opt.relativenumber = true
    end,
})

-- Autotrigger ZenMode
vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        -- Check if this is a real file and not the start screen
        if vim.bo.buftype ~= "" or vim.bo.filetype == "" then
            return
        end

        -- Check if Zen Mode is not already active
        if vim.fn.exists(':ZenMode') == 2 and not vim.g.zen_mode_active then
            vim.cmd("ZenMode")
        end
    end,
})
