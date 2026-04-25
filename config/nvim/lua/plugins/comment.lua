return {
	"numToStr/Comment.nvim",
	lazy = false,
	config = function()
		require("Comment").setup({
			pre_hook = function(ctx)
				local cs = vim.bo.commentstring
				if cs == nil or cs == "" then
					return "# %s"
				end
				return cs
			end,
		})
	end,
}
