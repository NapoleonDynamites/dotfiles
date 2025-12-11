local status, _ = pcall(vim.cmd, "colorscheme dracula-soft")
--local status, _ = pcall(vim.cmd("colorscheme miasma"))

--fix in nvim 0.11  
vim.cmd("highlight WinBar guifg=None guibg=None")
vim.cmd("highlight WinBarNC guifg=None guibg=None")
vim.cmd("highlight StatusLine guifg=None guibg=None")
-- error handling
if not status then
	print("Cannot load colorscheme!") -- print error if colorscheme not installed
	return
end
