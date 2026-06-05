vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

local opts = { noremap = true, silent = true }

-- Disiable arrow keys
-- keymap.set({ "n", "i", "v" }, "<Up>", "<Nop>", opts)
-- keymap.set({ "n", "i", "v" }, "<Down>", "<Nop>", opts)
-- keymap.set({ "n", "i", "v" }, "<Left>", "<Nop>", opts)
-- keymap.set({ "n", "i", "v" }, "<Right>", "<Nop>", opts)
-- keymap.set({ "n", "i", "v" }, "<S-Up>", "<Nop>", opts)
-- keymap.set({ "n", "i", "v" }, "<S-Down>", "<Nop>", opts)
-- keymap.set({ "n", "i", "v" }, "<S-Left>", "<Nop>", opts)
-- keymap.set({ "n", "i", "v" }, "<S-Right>", "<Nop>", opts)

-- Move lines up/down
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Move lines left/right
keymap.set("n", ">", '"_>>')
keymap.set("n", "<", '"_<<')
keymap.set("v", ">", '"_>gv')
keymap.set("v", "<", '"_<gv')

-- Replace regular paste
keymap.set("v", "p", '"_dP')

-- Undo tree
keymap.set("n", "<leader>ut", vim.cmd.UndotreeToggle)

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- Delete single character without copying into register
keymap.set("n", "x", '"_x')

-- toggle wrap
keymap.set("n", "<leader>we", ":set wrap!<CR>")

----------------------
-- Plugin Keybinds
----------------------

-- Harpoon
keymap.set("n", "<leader>hh", ":lua require('harpoon.mark').add_file()<CR>")
keymap.set("n", "<leader>hm", ":lua require('harpoon.ui').toggle_quick_menu()<CR>")
for i = 1, 9 do
	keymap.set("n", "<M-" .. tostring(i) .. ">", ":lua require('harpoon.ui').nav_file(" .. tostring(i) .. ")<CR>")
end
keymap.set("n", "<M-" .. ".>", ":lua require('harpoon.ui').nav_next()<CR>")
keymap.set("n", "<M-" .. ",>", ":lua require('harpoon.ui').nav_prev()<CR>")

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- clanger.nvim
keymap.set("n", "<leader>cm", ':lua require("clanger").ShowMenu()<CR>')

-- telescope
keymap.set("n", "<leader>tf", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>tb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>tw", "<cmd>Telescope live_grep<cr>") -- search for word in current working directory
keymap.set("n", "<leader>tr", "<cmd>Telescope oldfiles<cr>") -- list recently opened files
keymap.set("n", "<leader>tg", "<cmd>Telescope git_files<cr>") -- list git files
keymap.set("n", "<leader>th", "<cmd>Telescope help_tags<cr>") -- search for help tags
keymap.set("n", "<leader>ts", "<cmd>Telescope lsp_document_symbols<cr>") -- search for symbols in current buffer
keymap.set("n", "<leader>ti", "<cmd>Telescope lsp_implementations<cr>") -- search for implementations in current buffer
keymap.set("n", "<leader>tt", "<cmd>Telescope lsp_type_definitions<cr>") -- search for type definitions in current buffer
keymap.set("n", "<leader>tr", "<cmd>Telescope lsp_references<cr>") -- search for references in current buffer
keymap.set("n", "<leader>te", "<cmd>Telescope lsp_workspace_symbols<cr>") -- search for symbols in current workspace

-- MarkdownPreview
keymap.set("n", "<leader>md", ":MarkdownPreviewToggle<CR>")
