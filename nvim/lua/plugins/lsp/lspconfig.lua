-- Ensure plugins are installed
local lspconfig_status, lspconfig = pcall(require,"lspconfig")
if not lspconfig_status then
    return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
    return 
end

-- Keymaps
local keymap = vim.keymap

-- enable keybinds for specific language that is installed
local on_attach = function(client, bfr)
    local opts = { 
        noremap = true, 
        silent = true,
        buffer = bfr
    }

    -- Setting keybinds
    keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) 
    keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- list declaration for text under cursor
    keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
    keymap.set("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- show implementation of the text under cursor
    keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- show possible actions for the error under cursor
    keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- rename variables 
    keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show diagnostics of an error line
    keymap.set("n", "<leader>D", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics of the error where cursor is placed
    keymap.set("n", "[d", "<cmd>Lspsaga diagnostics_jump_prev<CR>", opts) -- 
    keymap.set("n", "]d", "<cmd>Lspsaga diagnostics_jump_next<CR>", opts)
    keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show docs for the highlighted string
    keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) 

end
   
-- Capabilities of lsp servers used to enable autocompletion
local capabilities = cmp_nvim_lsp.default_capabilities()
 
-- Configure HTML Server
lspconfig["html"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})

-- Configure Pyright Server
lspconfig["pyright"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})

-- Configure CSSLS Server
lspconfig["cssls"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})

-- Configure ASM Server
lspconfig["asm_lsp"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})

-- Configure Bash Server
lspconfig["bashls"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})

-- Configure C/C++ Server
lspconfig["clangd"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})

-- Configure Marksman Server
lspconfig["marksman"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})

