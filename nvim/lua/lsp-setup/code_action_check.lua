-- Checking to see if code action is available
local M = {}

local lsp_util = vim.lsp.util

function M.code_action_listener()
  local context = { diagnostics = vim.lsp.diagnostics.get_line_diagnostics() }
  local params = lsp_util.make_range_params()
  params.context = context
  vim.lsp.buf_request(0, 'textDocument/codeAction', params, function(err, result, ctx, config)
    
  end)
end


return M


