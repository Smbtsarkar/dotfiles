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

    -- Loading Popup api from Vim in neovim
    use 'nvim-lua/popup.nvim'

    -- Theme and Appearance plugins
    use 'folke/tokyonight.nvim'
    use 'nvim-lualine/lualine.nvim'
    use 'nvim-tree/nvim-web-devicons'

    -- File Manager
    use 'nvim-tree/nvim-tree.lua'

    -- Dependency for other plugins
    use 'nvim-lua/plenary.nvim'

    -- Plugin for changing surrounds
    use 'tpope/vim-surround'

    -- Auto pairs and Tags
    use 'windwp/nvim-autopairs'
    use 'windwp/nvim-ts-autotag'

    -- Telescope
    use { 'nvim-telescope/telescope.nvim', branch = '0.1.x' }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = "make" }

    -- Treesitter
    use { 'nvim-treesitter/nvim-treesitter', 
        run = function()
            require('nvim-treesitter.install').update({ with_sync = true })
        end
    }

    -- Autocompletion
    use 'hrsh7th/nvim-cmp'  -- completion plugin
    use 'hrsh7th/cmp-buffer'  -- buffer completion plugin
    use 'hrsh7th/cmp-path'  -- directory completion plugin
    use 'hrsh7th/cmp-cmdline'  -- commandline completion plugin
    use 'saadparwaiz1/cmp_luasnip'  -- snippet completion plugin

    -- Snippets
    use 'L3MON4D3/LuaSnip' -- Snippet engine
    use 'rafamadriz/friendly-snippets' -- useful snippets

    -- Automatically setup configuration
    if packer_setup then
        require('packer').sync()
    end
end)
