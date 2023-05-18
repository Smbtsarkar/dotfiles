-- Ensure plugin is installed
local status_ts, ts = pcall(require, "nvim-treesitter.configs")
if not status_ts then
  return
end

local status_at, attag = pcall(require, "nvim-ts-autotag")
if not status_at then
  return
end

ts.setup {
  ensure_installed = { 
    'python', 
    'lua',
    'json',
    'javascript',
    'html',
    'css',
    'vim',
    'gitignore',
    'bash',
    'graphql',
    'c',
    'cpp'
  },
  indent = {
    enable = true
  },
  autotag = {
    enable = true
  },
  highlight = {
    enable = true
  },
  auto_install = true,
}

