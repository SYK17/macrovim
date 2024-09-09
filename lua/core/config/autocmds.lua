--------------------------------
-- Dynamic Neovim Configurations
--------------------------------

----------------------------------
--  Absolute line number in insert
----------------------------------
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

----------------------
-- Default colorscheme
----------------------
vim.cmd("colorscheme macro")

--------------------------------------------
-- Auto set background color via bash script
--------------------------------------------
local function set_background()
    local handle = io.popen('/bin/bash ~/.config/nvim/scripts/detect-macos-appearance.sh')
    local result = handle:read("*a")
    handle:close()

    result = result:gsub("%s+", "")  -- Remove whitespace

    if result == "dark" then
        vim.o.background = "dark"
        -- vim.cmd("colorscheme candle-grey-transparent")
    else
        vim.o.background = "light"
        -- vim.cmd("colorscheme github_dark")
    end
end

-- Set the background on startup
set_background()

-- Create an autocommand to check and update the background when Neovim gains focus
vim.api.nvim_create_autocmd("FocusGained", {
    callback = function()
        set_background()
        vim.cmd("TransparentEnable")
    end,
})

----------------------
-- Autotrigger ZenMode
----------------------
--vim.api.nvim_create_autocmd("BufEnter", {
--    callback = function()
--        -- Check if this is a real file and not the start screen
--        if vim.bo.buftype ~= "" or vim.bo.filetype == "" then
--            return
--        end
--
--        -- Check if Zen Mode is not already active
--        if vim.fn.exists(':ZenMode') == 2 and not vim.g.zen_mode_active then
--            vim.cmd("ZenMode")
--        end
--    end,
--})
