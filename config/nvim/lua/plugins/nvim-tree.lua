return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	init = function()
		-- recommended settings from nvim-tree documentation
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
	end,
	opts = {
		filters = {
			dotfiles = true,
		},
		view = {
			--width = 20,
			float = {
				enable = true,
				open_win_config = {
					relative = "editor",
					border = "rounded",
					title = "File Browser",
					title_pos = "center",
					width = math.floor(vim.api.nvim_win_get_width(0) * 0.6),
					height = math.floor(vim.api.nvim_win_get_height(0) * 0.9),
					col = math.floor(vim.api.nvim_win_get_width(0) * 0.2),
					row = math.floor(vim.api.nvim_win_get_height(0) * 0.05),
				},
			},
		},
		renderer = {
			icons = {
				glyphs = {
					folder = {
						arrow_closed = "",
						arrow_open = "",
					},
					git = {
						unstaged = "",
						staged = "✓",
						unmerged = "",
						renamed = "➜",
						untracked = "󰓏",
						deleted = "",
						ignored = "◌",
					},
				},
			},
		},
		-- disable window_picker for
		-- explorer to work well with
		-- window splits
		actions = {
			open_file = {
				window_picker = {
					enable = false,
				},
			},
		},
	},
}
