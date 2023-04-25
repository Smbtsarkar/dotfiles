-- Ensure plugin is installed
local gt_status, gt = pcall(require, "gitsigns")
if not gt_status then
    return
end

gt.setup()
