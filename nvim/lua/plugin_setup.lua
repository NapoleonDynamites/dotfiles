local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()
-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugin_setup.lua source <afile> | PackerSync
  augroup end
]])
 
-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    -- My plugins here
    
    -- Dracula theme
    use("Mofiqul/dracula.nvim")
    -- Post-install/update hook with neovim command
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins

    -- statusline
	use{'nvim-lualine/lualine.nvim',requires ={'kyazdani42/nvim-web-devicons'}}
    
    -- commenting with gc
	use("numToStr/Comment.nvim")
    

    use("hrsh7th/nvim-cmp") -- completion plugin
    
    use("hrsh7th/cmp-buffer") -- source for text in buffer
    
    use("hrsh7th/cmp-path") -- source for file system paths
    
    -- easily configure language servers  
    use("neovim/nvim-lspconfig") 
   
    -- for autocompletionuse("hrsh7th/cmp-nvim-lsp") -- for autocompletion
    use("hrsh7th/cmp-nvim-lsp") 
    
    use({
        "glepnir/lspsaga.nvim",
        branch = "main",
        requires = {
        { "nvim-tree/nvim-web-devicons" },
        { "nvim-treesitter/nvim-treesitter" },
        },
     }) -- enhanced lsp uis
 	
    -- fuzzy finding w/ telescope
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
	use({ 
        "nvim-telescope/telescope.nvim", 
        branch = "0.1.x",
        requires = { {'nvim-lua/plenary.nvim'} }
    }) -- fuzzy finder   
    
    use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion
    use({ "L3MON4D3/LuaSnip", run = "make install_jsregexp" }) -- snippet engine
    use("saadparwaiz1/cmp_luasnip") -- for autocompletion
    use("rafamadriz/friendly-snippets") -- useful snippets
 
 use({
    'MeanderingProgrammer/render-markdown.nvim',
    after = { 'nvim-treesitter' },
    requires = { 'echasnovski/mini.nvim', opt = true }, -- if you use the mini.nvim suite
    -- requires = { 'echasnovski/mini.icons', opt = true }, -- if you use standalone mini plugins
    -- requires = { 'nvim-tree/nvim-web-devicons', opt = true }, -- if you prefer nvim-web-devicons
    config = function()
        require('render-markdown').setup({})
    end,
})

use {
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons', -- optional
  },
}

    if packer_bootstrap then
        require('packer').sync()
    end
end)
