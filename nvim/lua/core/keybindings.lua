-- +++++++++++++++++++++ --
-- Key bindings for NVIM --
-- +++++++++++++++++++++ --

-- Variable
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Setting up the leader key
vim.g.mapleader = " "


-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --
-- Syntax                            --
-- Options: <mode>, <keys>, <action> --
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --

-- ~~~~~~~~~~~~~~~ --
-- Generic Section --
-- ~~~~~~~~~~~~~~~ --

-- Remove highlight after searching
keymap("n","<Esc><Esc>",":nohl<CR>",opts)

-- Use x as delete only
keymap("n","x",'"_x',opts)

-- Paste without copying 
-- Yank text with ye : yank a word
keymap("v","p",'"_dP',opts)

-- keep indenting
keymap("v","<","<gv",opts)
keymap("v",">",">gv",opts)

-- Move text up and down
keymap("x","K",":move '<-2<CR>gv-gv",opts)
keymap("x","J",":move '>+1<CR>gv-gv",opts)

-- Remap Arrow keys to Ctrl + h,j,k,l
keymap("i","<C-h>","<Left>",opts)
keymap("i","<C-l>","<Right>",opts)
keymap("i","<C-j>","<Down>",opts)
keymap("i","<C-k>","<Up>",opts)


-- ~~~~~~~~~~~~~~~~~~ -- 
-- Splits and Windows --
-- ~~~~~~~~~~~~~~~~~~ --
-- Vsplit new window
keymap("n","<leader><S-h>",":new<CR>",opts)
keymap("n","<leader><S-v>",":vnew<CR>",opts)

-- Navigation
keymap("n","<C-h>","<C-w>h",opts)
keymap("n","<C-j>","<C-w>j",opts)
keymap("n","<C-k>","<C-w>k",opts)
keymap("n","<C-l>","<C-w>l",opts)

-- Resize with Arrows
keymap("n","<S-Up>",":resize +2<CR>",opts)
keymap("n","<S-Down>",":resize -2<CR>",opts)
keymap("n","<S-Left>",":vertical resize +2<CR>",opts)
keymap("n","<S-Right>",":vertical resize -2<CR>",opts)

-- Navigate buffers
keymap("n","<S-n>",":bnext<CR>",opts)
-- close buffer 
keymap("n","<leader>x",":close<CR>", opts)

-- ~~~~~~~~~~~~~~ --
-- Plugin Section --
-- ~~~~~~~~~~~~~~ --

-- Open NvimTree
keymap("n","<leader>e",":NvimTreeToggle<CR>",opts)

-- Search files with Telescope
keymap("n","<leader>ff","<cmd>Telescope find_files<CR>",opts)

-- Search for strings in the current project
keymap("n","<leader>fs","<cmd>Telescope live_grep<CR>",opts)

-- Show active buffers in Telescope
keymap("n","<leader>fb","<cmd>Telescope buffers<CR>",opts)

-- Show help tags
keymap("n","<leader>fh","<cmd>Telescope help_tags<CR>",opts)
