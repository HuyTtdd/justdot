local lsp = require('lsp-zero').preset({})

-- Setup lsp server
lsp.on_attach(
    function(client, bufnr)
        -- Look at me. I'm useless.
    end
)

lsp.ensure_installed({
  -- Replace these with whatever servers you want to install
  'tsserver',
  'pyright',
  'clangd',
  'cssls',
  'emmet_language_server',
  'html',
  'lua_ls',
})

require('lspconfig').tsserver.setup{}
require('lspconfig').pyright.setup{}
require('lspconfig').clangd.setup{}
require('lspconfig').cssls.setup{}
require('lspconfig').emmet_language_server.setup{}
require('lspconfig').lua_ls.setup{}
require('lspconfig').html.setup{}
require('lspconfig').jdtls.setup{}
require('lspconfig').marksman.setup{}

lsp.setup()

-- Completion mapping
local cmp = require('cmp')
local cmp_select_opts = { behavior = cmp.SelectBehavior.Insert }
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    sources = {
        {
            name = 'nvim_lsp'
        },
    },
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<C-j>'] = cmp.mapping.scroll_docs(-4),
        ['<C-k>'] = cmp.mapping.scroll_docs(4),
        ['<Tab>'] = cmp_action.tab_complete(),
        ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
})

-- LSP action mapping
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set({'n', 'x'}, '<leader>f', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    end
})

vim.diagnostic.disable()
