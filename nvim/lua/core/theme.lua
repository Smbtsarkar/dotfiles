-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --
-- Initializing the theme                           --
-- Ensuring the theme is installed and then sets it --
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --


local status, tn = pcall(vim.cmd, "colorscheme tokyonight-night")
if not status then
    print("Colorscheme not found!")
    return
end
