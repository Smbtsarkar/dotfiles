-- Setting up plugin manager
-- Function checks to see if packer is already installed

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

-- Autoreload neovim when the plugins file is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugin-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
    return
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
  use 'nvim-lua/plenary.nvim' -- list of functions that is used by other plugins
  -- use 'ellisonleao/gruvbox.nvim' -- colorscheme
  use 'folke/tokyonight.nvim' -- theme
  use 'christoomey/vim-tmux-navigator' -- helper to work with tmux
  use 'szw/vim-maximizer' -- allows toggling of pane to maximize
  use 'tpope/vim-surround' -- allows us to manipulate words and lines
  use 'vim-scripts/ReplaceWithRegister' -- allows us to replace words with ease
  use 'numToStr/Comment.nvim' -- helps with commenting
  use 'nvim-tree/nvim-tree.lua' -- file manager
  use 'kyazdani42/nvim-web-devicons' -- vscode like icons
  use 'nvim-lualine/lualine.nvim' -- status line
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = "make" } -- fuzzy finder dependency for telescope
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x' } -- telescope branch as per the gitrepo
  use 'hrsh7th/nvim-cmp' -- plugin for autocompletion
  use 'hrsh7th/cmp-buffer' -- source for nvim cmp from the current buffer
  use 'hrsh7th/cmp-path' -- source for nvim cmp for file paths
  use 'L3MON4D3/LuaSnip' -- snippet engine
  use 'saadparwaiz1/cmp_luasnip' -- source for nvim cmp to show snippets
  use 'rafamadriz/friendly-snippets' -- collection of useful snippets
  use 'williamboman/mason.nvim' -- managing and installing lsp servers
  use 'williamboman/mason-lspconfig.nvim' -- helper plugin for managing lsp servers 
  use 'neovim/nvim-lspconfig' -- configuring lsp servers
  use 'hrsh7th/cmp-nvim-lsp' -- add lsp servers to autocompletion
  use { 'glepnir/lspsaga.nvim', branch = "main" } -- provide a better UI
  use 'onsails/lspkind.nvim' -- vscode like icons in autocompletion
  use 'jose-elias-alvarez/null-ls.nvim' -- formatting and linting
  use 'jay-babu/mason-null-ls.nvim' -- formatting and linting
  use { 'nvim-treesitter/nvim-treesitter', 
        run = function()
            require('nvim-treesitter.install').update({ with_sync = true })
        end
  }
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use 'lewis6991/gitsigns.nvim' -- git integration

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

