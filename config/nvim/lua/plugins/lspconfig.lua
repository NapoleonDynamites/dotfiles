return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	lazy = false,
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("my.lsp", {}),
			callback = function(args)
				-- keybind options
				local opts = { noremap = true, silent = true, buffer = args.buf }
				local keymap = vim.keymap

				-- set keybinds
				keymap.set("n", "gf", "<cmd>Lspsaga finder<CR>", opts) -- show definition, references
				keymap.set("n", "gD", "<cmd>Lspsaga goto_definition<CR>", opts) -- go to declaration
				keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
				keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
				keymap.set("n", "gh", "<cmd>ClangdSwitchSourceHeader<CR>", opts) -- C switch header/source
				keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
				keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
				keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
				keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
				keymap.set("n", "[w", "<cmd>Lspsaga show_workspace_diagnostics<CR>", opts) -- show workspace diagnostics
				keymap.set("n", "]w", "<cmd>Lspsaga show_workspace_diagnostics<CR>", opts) -- show workspace diagnostics
				keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
				keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
				keymap.set("n", "<leader>K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
				keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side
				keymap.set("n", "<leader>f", function()
					vim.lsp.buf.format()
				end, opts)
				keymap.set("i", "<C-h>", function()
					vim.lsp.buf.signature_help()
				end, opts)
				keymap.set("n", "<C-h>", function()
					vim.lsp.buf.signature_help()
				end, opts)
			end,
		})

		vim.diagnostic.config({
			underline = true,
			virtual_text = true,
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.INFO] = " ",
					[vim.diagnostic.severity.HINT] = " ",
				},
			},
		})

		local default_capabilities = require("cmp_nvim_lsp").default_capabilities()

		vim.lsp.config("*", {
			capabilities = default_capabilities,
			root_markers = { ".git" },
		})

		vim.lsp.enable("clangd")
		vim.lsp.enable("yamlls")
		vim.lsp.enable("jsonls")
		vim.lsp.enable("bashls")
		vim.lsp.enable("pylsp")
		vim.lsp.enable("sourcekit")

		vim.lsp.config("lua_ls", {
			capabilities = default_capabilities,
			settings = {
				Lua = {
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
		vim.lsp.enable("lua_ls")
	end,
}
