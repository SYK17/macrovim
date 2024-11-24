vim.api.nvim_create_user_command('MarkdownToPDF', function()
	local current_file = vim.fn.expand('%:p')
	local pdf_file = vim.fn.expand('%:p:r') .. '.pdf'

	local cmd = string.format(
		'pandoc "%s" '..
		'--pdf-engine=pdflatex '..  -- Changed from xelatex to pdflatex
		'--variable fontsize=12pt '..
		'--variable geometry:margin=1in '..
		'--variable linkcolor=blue '..
		'--highlight-style=tango '..
		'-o "%s"',
		current_file, pdf_file
	)

	local output = vim.fn.system(cmd)
	local exit_code = vim.v.shell_error

	if exit_code ~= 0 then
		print("Pandoc Error:")
		print(output)
	else
		print("Successfully converted to PDF!")
	end
end, {})

vim.keymap.set('n', '<leader>mp', ':MarkdownToPDF<CR>', { silent = false })
