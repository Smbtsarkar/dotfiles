-- Ensure plugin is installed
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
  return
end

local lsnip_status, lsnip = pcall(require, "luasnip")
if not lsnip_status then
  return
end

local status_lspk, lspk = pcall(require, "lspkind")
if not status_lspk then
  return
end

local status_nap, nap = pcall(require, "nvim-autopairs")
if not status_nap then
  return
end 

-- Initiate Setup
require("luasnip.loaders.from_vscode").lazy_load()

lsnip.config.setup {}

vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  formatting = {
    format = lspk.cmp_format({
      mode = 'text_symbol',
      maxwidth = 50,
      ellipsis_char = '...',
      --before = function (entry, vim_item)
      --  ...
      --end
    })
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered()
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),        -- Scroll Up
    ['<C-f>'] = cmp.mapping.scroll_docs(4),         -- Scroll Down
    ['<CR>'] = cmp.mapping.confirm {                -- Press Enter to confirm a selection
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    },
    ['<C-space>'] = cmp.mapping.complete(),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif lsnip.expand_or_jumpable() then
        lsnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' })
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
    { name = 'buffer' }
  }),
  experimental = {
    ghost_text = true
  }
}

cmp.event:on(
  'confirm_done',
  require('nvim-autopairs.completion.cmp').on_confirm_done()
)

nap.setup({
  check_ts = true,
  ts_config = {
    lua = { "string" },
  }
})

