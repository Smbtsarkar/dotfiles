-- +++++++++++++++++++ --
-- Basic configuration --
-- +++++++++++++++++++ --

-- Creating a variable
local opt = vim.opt

-- Setting relating number
opt.relativenumber = true
opt.number = true

-- Setting tabs and indentations
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.breakindent = true
opt.smartindent = true

-- Autosave on change
opt.autowrite = true

-- Setting search parameters
opt.ignorecase = true                                       -- ignore case in search patterns
opt.smartcase = true 

-- Enabling cursor line for easier view
opt.cursorline = true
opt.cursorlineopt = "number"

-- Enabling good colors
opt.termguicolors = true

-- Code folds
opt.foldclose = ""
opt.foldmethod = "manual"

-- Ensuring saving
opt.fsync = true

-- Setting global as default for substitute
opt.gdefault = true

-- Match Pairs
opt.matchpairs = "(:),{:},[:],<:>"

-- Prevent auto commenting for new line
vim.cmd [[set formatoptions="jroql"]]

-- Enable clipboard
opt.clipboard:append("unnamedplus")

-- Sign Column Visibility
opt.signcolumn = "yes"

-- "-" is part of a word
vim.cmd [[set iskeyword+=-]]

-- Syntax highlighting
opt.syntax = "ON"

-- Line wrap
opt.linebreak = true                                -- 

-- Mouse
opt.mouse = "a"                                     -- Allow the use of mouse

-- CMD Height
opt.cmdheight = 2                                   -- More space to view messages in the status bar

-- backup
opt.backup = false                                  -- does not create a bkp file

-- Completion
opt.completeopt = { "menuone", "noselect" }         -- for completions 

-- Markdown
opt.conceallevel = 0                               -- so that `` is visible in markdown files 

-- Encoding 
opt.fileencoding = "utf-8"                          -- Setting default file encoding to utf8

-- pop-up menu height
opt.pumheight = 10                                  --- Height of pop-up menus

-- Highlighting
opt.hlsearch = true

-- Hide the current mode
opt.showmode = false

-- Always show tabs
opt.showtabline = 2

-- Disable swapfile
opt.swapfile = false

-- Enable persistent undo
opt.undofile = true

-- Faster completion
opt.updatetime = 300


-- Splitting
opt.splitbelow = true
opt.splitright = true
