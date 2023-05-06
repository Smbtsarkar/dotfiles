-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --
-- Configuration for autocomplete --
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --

-- Ensuring that completion plugin is installed
local status_cmp, cmp = pcall(require,"cmp")
if not status_cmp then
    return
end

-- Ensuring snippets engine is installed
local status_snp, snp = pcall(require,"luasnip")
if not status_snp then
    return
end

-- Loading snippets from vscode
require("luasnip.loaders.from_vscode").lazy_load()

-- Fixing backspace
local check_backspace = function()
    local col = vim.fn.col "." -1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

-- Setting up completion
cmp.setup {
    -- setting the snippet engine
    snippet = {
        expand = function(args)
            snp.lsp_expand(args.body)
        end
    },
    -- Setting keymaps
    mapping = {
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
    }
}


