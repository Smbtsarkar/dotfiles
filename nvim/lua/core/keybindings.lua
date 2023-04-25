-- Configure the leader key
vim.g.mapleader = " "

local keymap = vim.keymap

-- ---------------------------------- --
-- General Keymap                     --
-- Options: <mode>, <keys>, <action>  --
-- ---------------------------------- --

-- Remove highlight after searching
keymap.set("n","<leader>nh",":nohl<CR>")

-- Delete characters with x but don't copy to clipboard
keymap.set("n","x",'"_x')

-- Increment and decrement numbers 
keymap.set("n","<leader>+","<C-a>")
keymap.set("n","<leader>-","<C-x>")

-- Split windows
keymap.set("n","<leader>sv","<C-w>v") -- split window vertically
keymap.set("n","<leader>sh","<C-w>s") -- split window horizontally
keymap.set("n","<leader>se","<C-w>=") -- split window equal width
keymap.set("n","<leader>sx",":close<CR>") -- close current split window

-- Tabs 
keymap.set("n","<leader>to",":tabnew<CR>") -- open a new tab
keymap.set("n","<leader>tx",":tabclose<CR>") -- close current tab
keymap.set("n","<leader>tn",":tabn<CR>") -- go to next tab
keymap.set("n","<leader>tp",":tabp<CR>") -- go to prev tab

-- Plugin Section
-- Vim Maximizer
keymap.set("n","<leader>sm",":MaximizerToggle<CR>")

-- NvimTree
keymap.set("n","<leader>e",":NvimTreeToggle<CR>")

-- Telescope
keymap.set("n","<leader>ff","<cmd>Telescope find_files<CR>") -- use telescope to find files in the project
keymap.set("n","<leader>fs","<cmd>Telescope live_grep<CR>") -- find text in our project
keymap.set("n","<leader>fc","<cmd>Telescope grep_string<CR>") -- find current string the cursor is on in our project
keymap.set("n","<leader>fb","<cmd>Telescope buffers<CR>") -- show active buffers
keymap.set("n","<leader>fh","<cmd>Telescope help_tags<CR>") -- show help tags

