-- Ensuring we have nvimtree installed
local status, nvimtree = pcall(require, "nvim-tree")
if not status then
    return
end

-- Suggested config in documentation
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- Change color of arrows 
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#98971a ]])

nvimtree.setup({
    renderer = {
        icons = {
            glyphs = {
                folder = {
                    arrow_closed = "",
                    arrow_open = ""
                }
            }
        }
    },
    actions = {
        open_file = {
            window_picker = {
                enable = false
            }
        }
    }
})
