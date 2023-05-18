-- Require LSP Config
local lspcfg_Status, lspcfg = pcall(require,"lspconfig")
if not lspcfg_Status then
  return
end

local cmp_lsp_status, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_lsp_status then
  return
end

-- Ensuring Keybindings only when a relavant file is attached
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }
    local keymap = vim.keymap

    -- Jump to the definition 
    keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  
    -- Show information about the symbol under cursor
    keymap.set('n', 'K', vim.lsp.buf.hover, opts)

    -- List all the implementations for the symbol
    keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)

    -- List the type definition
    keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)

    -- Rename file
    keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

    -- Code action
    keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, opts)

    -- Format the code
    keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)

  end
})

-- Enable additional completions for language server
local servers = {'pyright'}

local capabilities = cmp_lsp.default_capabilities()

for _, lsp in ipairs(servers) do
  lspcfg[lsp].setup {
    capabilities = capabilities  
  }
end

-- Check for code action
--autocmd CursorHold,CursorHoldI * lua require('lsp-setup.code_action_check').code_action_listener()
