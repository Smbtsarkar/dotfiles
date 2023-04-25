-- Ensuring that the plugin is installed
local status, telescope = pcall(require, "telescope")
if not status then
    return
end

local action_status, telescope_action = pcall(require, "telescope.actions")
if not action_status then
    return
end

telescope.setup({
    -- custom keymaps
    defaults = {
        mappings = {
            i = {
                ["C-k"] = telescope_action.move_selection_previous,
                ["C-j"] = telescope_action.move_selection_next,
                -- Send selection to a quick fix list
                ["C-q"] = telescope_action.send_selected_to_qflist + telescope_action.open_qflist
            }
        }
    }
})

telescope.load_extension("fzf")
