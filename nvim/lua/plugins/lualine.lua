-- Checking to ensure plugin is installed
local status, lualine = pcall(require, "lualine")
if not status then
    return
end

-- theme
local lualine_theme = require("lualine.themes.auto")

lualine.setup({
    options = {
        theme = lualine_theme
    }
})
