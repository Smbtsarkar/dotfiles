-- Ensure plugin is installed
local autopairs_status, autopairs = pcall(require, "nvim-autopairs")
if not autopairs_status then
    return
end

autopairs.setup({
    check_ts = true, -- enable treesitter
    ts_config = {
        lua = { "string" }, -- do not add pairs in lua string treesitter node
        javascript = { "template_string" }, -- do not add pairs for javascript template
        java = false -- don't check treesitter on java
    }
})

-- Import nvim autopairs completion
local cmp_autopairs_status, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
if not cmp_autopairs_status then
    return
end

local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
    return
end

-- Enable completions and autopairs 
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
