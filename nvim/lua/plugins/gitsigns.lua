-- Ensure plugin installed
local setup, gitsigns = pcall(requrie, "gitsigns")
if not setup then
  return
end

gitsigns.setup()
