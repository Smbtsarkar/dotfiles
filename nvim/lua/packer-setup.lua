-- +++++++++++++++++ --
-- Setting up packer --
-- +++++++++++++++++ --

-- Function to autoinstall packer --
local packer_install = function()
    -- Getthing the installation path of packer
    local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    -- checking to see if path is empty
    if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        -- Execute the git clone command to install packer if not installed
        vim.fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[ packadd packer.nvim ]]
        return true
    end
    return false
end

local packer_setup = packer_install()

-- Autreload the nvim plugins when this file is saved
vim.cmd([[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer-setup.lua source <afile> | PackerSync
    augroup end
]])

-- Checking to see if packer is loaded
local status, packer = pcall(require, "packer")
-- Ensuring we stop if packer is not installed
if not status then
    return
end

-- Configure packer to use a window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end
    }
}

return require('packer').startup(function(use)
    -- Loading the packer plugin
    use 'wbthomason/packer.nvim'

    -- Theme 
    use 'navarasu/onedark.nvim'
    use { "catppuccin/nvim", as = "catppuccin" }

    -- Dependency for other plugins
    use 'nvim-lua/plenary.nvim'
  
    -- Usefull Plugins
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }                                                                 -- auto pairs
 
    use {'nvim-treesitter/nvim-treesitter',
      run = function()
        require('nvim-treesitter.install').update({ with_sync = true }) 
      end }                                                           -- Improved highlighting
    use 'windwp/nvim-ts-autotag'                                      -- Auto tags
    use 'numToStr/Comment.nvim'                                       -- Mass commenting
    use 'nvim-tree/nvim-tree.lua'                                     -- File explorer
    use 'nvim-tree/nvim-web-devicons' 
    use 'nvim-lualine/lualine.nvim'                                   -- Status line 
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = "make" }  -- Finder
    use { 'nvim-telescope/telescope.nvim', branch = '0.1.x' }
    use 'lewis6991/gitsigns.nvim'                                     -- Git signs    

    -- Language Server Plugins
    use { 'williamboman/mason.nvim', run = ":MasonUpdate" }           -- Install different packages for LSP
    use 'williamboman/mason-lspconfig.nvim'                           -- Configure mason with lspconfig to make managing servers easier
    use 'neovim/nvim-lspconfig'                                       -- Configuration for different LSP Clients
    use 'mfussenegger/nvim-dap'                                       -- Debug adapter
    use 'jose-elias-alvarez/null-ls.nvim'                             -- Code actions, diagnostics, etc.

    -- Auto Completion and Snippets
    use 'hrsh7th/nvim-cmp'                                            -- Autocompletion plugin
    use 'hrsh7th/cmp-path'                                            -- Autocompletion plugin for system path
    use 'hrsh7th/cmp-buffer'                                          -- Show buffer
    use 'hrsh7th/cmp-nvim-lsp'                                        -- LSP Source for nvim cmp
    use 'saadparwaiz1/cmp_luasnip'                                    -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip'                                            -- Snippets plugin
    use 'rafamadriz/friendly-snippets'                                -- VS Code like snippets
    use 'onsails/lspkind.nvim'                                        -- VS Code like suggestions

    -- Automatically setup configuration
    if packer_setup then
        require('packer').sync()
    end
end)
