local opt = vim.opt

opt.relativenumber = true
opt.number = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.list = true
opt.ignorecase = true
opt.smartcase = true

opt.wrap = false

opt.cursorline = false

opt.termguicolors = true
opt.signcolumn = "yes"

opt.scrolloff = 8

opt.backspace = "indent,eol,start"

opt.clipboard:append("unnamedplus")

opt.splitright = true
opt.splitbelow = true

vim.cmd("set cmdheight=0")
vim.cmd("set mouse=")

opt.iskeyword:append("-")
vim.cmd([[
    autocmd FileType bitbake setlocal noexpandtab
]])
-- Persistent undo
if vim.fn.has("persistent_undo") == 1 then
	local target_path = vim.fn.stdpath("state") .. "/undo"

	if vim.fn.isdirectory(target_path) == 0 then
		vim.fn.mkdir(target_path, "p", "0o700")
	end

	vim.opt.undodir = target_path
	vim.opt.undofile = true
end

