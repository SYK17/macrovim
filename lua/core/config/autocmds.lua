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
-- vim.cmd("colorscheme macro")

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
        vim.cmd("colorscheme macro")
    else
        vim.o.background = "light"
        vim.cmd("colorscheme macro")
    end
end

-- Set the background on startup
set_background()

-- Create an autocommand to check and update the background when Neovim gains focus
vim.api.nvim_create_autocmd("FocusGained", {
    callback = function()
        set_background()
        require('lualine').setup()  -- Ensure lualine is set up again
        vim.cmd('redrawstatus')     -- Force a redraw of the status line
    end,
})