-- Variable
local opt = vim.opt 

-- Set Line Numbers
opt.relativenumber = true
opt.number = true

-- Set tabs and indentations
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- Set Line Wrapping
opt.wrap = false

-- Set search parameters
opt.ignorecase = true
opt.smartcase = true

-- Set cursor line
opt.cursorline = true

-- Set Color Settings
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- Fix backspace issue
opt.backspace = "indent,eol,start"

-- Set Clipboard access
opt.clipboard:append("unnamedplus")

-- Split Windows
opt.splitright = true
opt.splitbelow = true

-- Changing "-" to be part of a word
opt.iskeyword:append("-")

