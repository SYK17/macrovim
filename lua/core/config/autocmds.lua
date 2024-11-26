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


--------------------------------------------
-- Auto set background color via bash script
--------------------------------------------

-- default colorscheme or fallback
vim.g.SCHEME = "macro"  -- your default theme

-- Load colorscheme on startup
vim.api.nvim_create_autocmd("VimEnter", {
    nested = true,
    callback = function()
        pcall(vim.cmd.colorscheme, vim.g.SCHEME)
    end,
})

-- Save colorscheme when changed
vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function(params)
        vim.g.SCHEME = params.match
    end,
})

-- Your existing background detection
local function set_background()
    local handle = io.popen('/bin/bash ~/.config/nvim/scripts/detect-macos-appearance.sh')
    local result = handle:read("*a")
    handle:close()
    result = result:gsub("%s+", "")  -- Remove whitespace
    
    if result == "dark" then
        vim.o.background = "dark"
    else
        vim.o.background = "light"
    end
    
    -- Use the saved scheme
    pcall(vim.cmd.colorscheme, vim.g.SCHEME)
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
