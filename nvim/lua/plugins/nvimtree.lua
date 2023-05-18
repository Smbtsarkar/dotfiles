-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set termgui colors to enable highlight groups
vim.opt.termguicolors = true

-- Ensure plugin installed
local status, nvt = pcall(require, "nvim-tree")
if not status then
  return
end

vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

nvt.setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
    icons = {
      glyphs = {
        folder = {
          arrow_closed = "󰁙",
          arrow_open = "󰁋"
        }
      }
    }
  },
  filters = {
    dotfiles = true
  }
})
