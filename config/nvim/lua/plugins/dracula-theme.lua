return {
	"Mofiqul/dracula.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("dracula")
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
		vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
		vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
		vim.cmd("highlight WinBar guifg=None guibg=None")
		vim.cmd("highlight WinBarNC guifg=None guibg=None")
		vim.cmd("highlight StatusLine guifg=None guibg=None")

		local dracula_colors = require("dracula").colors()
		vim.cmd("highlight NvimTreeIndentMarker guifg=" .. dracula_colors.purple .. " guibg=NONE")
		vim.cmd("highlight NvimTreeNormal guibg=NONE")
	end,
}
