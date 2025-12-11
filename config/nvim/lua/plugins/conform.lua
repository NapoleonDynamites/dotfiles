require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		swift = { "swift__format" },
		c = { "clang-format" },
		-- cpp = { "clang-format" },
		-- cxx = { "clang-format" },
		-- objc = { "clang-format" },
		-- objcpp = { "clang-format" },
		qml = { "qmlformat" },
	},
	formatters = {
		qmlformat = {
			command = "qmlformat",
			args = { "-i", "-n", "--objects-spacing", "--functions-spacing", "$FILENAME" },
			stdin = false,
		},
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
