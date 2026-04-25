return {
	"glepnir/lspsaga.nvim",
	opts = {
		ui = {
			code_action = " ",
		},
		lightbulb = {
			virtual_text = false,
		},
		-- keybinds for navigation in lspsaga window
		scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
		-- use enter to open file with definition preview
		definition = {
			edit = "<CR>",
		},
	},
}
