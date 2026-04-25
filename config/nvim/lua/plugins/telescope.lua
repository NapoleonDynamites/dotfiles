return {
	"nvim-telescope/telescope.nvim",
	lazy = false,
	opts = {
		defaults = {
			mappings = {
				i = {
					["<C-k>"] = require("telescope.actions").move_selection_previous, -- move to prev result
					["<C-j>"] = require("telescope.actions").move_selection_next, -- move to next result
				},
			},
		},
	},
}
