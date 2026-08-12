require('mason-lspconfig').setup({
    ensure_installed = {
        'ts_ls',
        'pyright',
        'clangd',
        'cssls',
        'emmet_language_server',
        'html',
        'lua_ls',
        'rust_analyzer',
    },
    handlers = {
        function(server_name)
            vim.lsp.config(server_name, {})
            vim.lsp.enable(server_namer)
        end,
    }
})

require("blink.cmp").setup({
    keymap = {
        preset = "none",
        ["<Tab>"] = {
            function(cmp)
                if cmp.is_visible() then
                    return cmp.select_next()
                elseif vim.snippet.active({ direction = 1 }) then
                    return vim.snippet.jump(1)
                end
            end,
            "fallback",
        },

        ["<S-Tab>"] = {
            function(cmp)
                if cmp.is_visible() then
                    return cmp.select_prev()
                elseif vim.snippet.active({ direction = -1 }) then
                    return vim.snippet.jump(-1)
                end
            end,
            "fallback",
        },
    },
    sources = {
        default = { "lsp", "path", "buffer" },
    },
    completion = {
        keyword = { range = "prefix", },
        list = { 
            selection = { preselect = false, auto_insert = true },
            cycle = {
                from_bottom = false,
                from_top = false,
            },
        },
        menu = {
            scrollbar = false,
            draw = {
                align_to = "cursor",
            },
        },
        ghost_text = { enabled = false },
    },
})

-- LSP action mapping
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({'n', 'x'}, '<leader>f', function()
            vim.lsp.buf.format({async = true})
        end, opts)
    end
})

vim.diagnostic.enable(false)
