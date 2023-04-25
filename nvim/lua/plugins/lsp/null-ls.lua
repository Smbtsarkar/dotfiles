-- Ensure plugin is installed
local null_ls_status, null_ls = pcall(require, "null-ls")
if not null_ls_status then
    return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {} )

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.code_actions.eslint_d,
        null_ls.builtins.diagnostics.cpplint,
        null_ls.builtins.diagnostics.pylint
    },
    -- Format on save file
    on_attach = function(current_client, buff)
        if current_client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = buff })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = buff,
                callback = function()
                    vim.lsp.buf.format({
                        filter = function(client)
                            -- only use null-ls for formatting instead of lsp server
                            return client.name == "null-ls"
                        end,
                        buffer = buff
                    })
                end,
            })
        end
    end
})

