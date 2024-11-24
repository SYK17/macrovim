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
-- vim.cmd("colorscheme 256_noir")

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
        vim.cmd('TransparentEnable')
    else
        vim.o.background = "light"
        vim.cmd("colorscheme macro")
        vim.cmd('TransparentDisable')
    end
end

-- Check on startup
set_background()

vim.api.nvim_create_autocmd("FocusGained", {
    callback = function()
        require("lualine").setup()
        vim.cmd("redraw")
        vim.cmd("redrawstatus")
    end,
    desc = "Update colorscheme and redraw UI based on system appearance."
})
