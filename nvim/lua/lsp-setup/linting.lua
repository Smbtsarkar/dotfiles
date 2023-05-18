-- Ensure the plugin is installed
local nls_status, nls = pcall(require, "null-ls")
if not nls_status then
  return
end

-- Sources
-- Code Action
local code_actions = nls.builtins.code_actions

-- Diagnostics
local diagnostics = nls.builtins.diagnostics

-- Formatting Sources
local formatting = nls.builtins.formatting

-- Hover Sources
local hover = nls.builtins.hover

-- Completion
local completion = nls.builtins.completion

nls.setup {
  border = "rounded",
  sources = {
    diagnostics.pylint,
    formatting.black,
    completion.luasnip
  },
  update_in_insert = true
}



