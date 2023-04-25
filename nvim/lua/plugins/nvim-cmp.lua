-- Ensure plugin is installed
local cmp_status, nvimcmp = pcall(require, "cmp")
if not cmp_status then
    return
end

local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
    return
end

local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
    return
end


-- load snippets from the friendly snippets plugin
require("luasnip.loaders.from_vscode").lazy_load()

vim.opt.completeopt = "menu,menuone,noselect" 

nvimcmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    -- Key maps
    mapping = nvimcmp.mapping.preset.insert({
        ["<C-k>"] = nvimcmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-j>"] = nvimcmp.mapping.select_next_item(), -- next suggestion
        ["<C-d>"] = nvimcmp.mapping.scroll_docs(-4), -- scroll up 
        ["<C-f>"] = nvimcmp.mapping.scroll_docs(4), -- scroll down
        ["<C-Space>"] = nvimcmp.mapping.complete(), -- show completion suggestions
        ["<C-e>"] = nvimcmp.mapping.abort(), -- close completion window
        ["<CR>"] = nvimcmp.mapping.confirm({ select = false }) -- confirm selection
    }),
    -- Sources for autocompletion
    sources = nvimcmp.config.sources({
        { name = "nvim_lsp" }, -- LSP as source for autocompletion
        { name = "luasnip" }, -- snippets
        { name = "buffer" }, -- text within current buffer
        { name = "path" } -- file system path
    }),
    -- Format the vscode like icons
    formatting = {
        format = lspkind.cmp_format({
            maxwidth = 50,
            ellipsis_char = "..."
        })
    }
})
