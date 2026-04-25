return {
	{
		"romus204/tree-sitter-manager.nvim",
		dependencies = {},
		config = function()
			require("tree-sitter-manager").setup({
				-- ensure_installed = {},
				-- border = nil,
				auto_install = true,
				-- highlight = true,
				-- languages = {},
				-- parser_dir = vim.fn.stdpath("data") .. "/site/parser",
				-- query_dir = vim.fn.stdpath("data") .. "/site/queries",
			})
		end,
	},
}
