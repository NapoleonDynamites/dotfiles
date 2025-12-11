-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

keymap.set("n", "<leader>wq", ":wqa<CR>")

keymap.set("n", "<leader>ff", ":%s/")

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", ">", '"_>>')
keymap.set("n", "<", '"_<<')

keymap.set("v", ">", '"_>gv')
keymap.set("v", "<", '"_<gv')

keymap.set("v", "p", '"_dP')

keymap.set("n", "<leader>d", '"_d')
keymap.set("v", "<leader>d", '"_d')

keymap.set("n", "<leader>,", "<C-w>h")
keymap.set("n", "<leader>.", "<C-w>l")

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- telescope
keymap.set("n", "<leader>tf", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>tw", "<cmd>Telescope live_grep<cr>") -- search for word in current working directory
