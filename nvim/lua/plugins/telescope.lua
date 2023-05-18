-- Ensure plugin installed
local status_ts, ts = pcall(require, "telescope")
if not status_ts then
  return 
end


local status_tsa, tsa = pcall(require, "telescope.actions")
if not status_tsa then
  return 
end

ts.setup({
  defaults = {
    mappings = {
      i = {
        ["<C-k>"] = tsa.move_selection_previous,
        ["<C-j>"] = tsa.move_selection_next
      }
    }
  }
})
