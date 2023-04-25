-- Ensure plugin is installed
local lspsaga_status, lspsaga = pcall(require, "lspsaga")
if not lspsaga_status then
    return
end

-- Initializing
lspsaga.setup({
    move_in_saga = { prev = "<C-k>", next = "<C-j>" },
    finder_action_keys = {
        open = "<CR>"
    },
    definition_action_keys = {
        edit = "<CR>" 
    }
})
