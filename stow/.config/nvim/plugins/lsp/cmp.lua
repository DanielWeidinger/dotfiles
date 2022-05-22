vim.o.completeopt = "menu,menuone,noselect"

-- Setup nvim-cmp.
local cmp = require'cmp'
local lspkind = require('lspkind') -- Better iconography for completion

-- NOTE: Copilot setup
-- vim.schedule(function() require("copilot").setup({plugin_manager_path="~/.vim/plugged"}) end)

cmp.setup {
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
            -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
        end,
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.scroll_docs(-4),
        ['<C-n>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        -- ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        -- ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
        -- { name = "copilot", group_index = 2},
        { name = 'nvim_lsp' },
        { name = 'vsnip' }, -- For vsnip users.
        -- { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
    }, {
        { name = 'buffer' },
        { name = 'path' },
        { name = 'spell' },
        { name = 'calc' },
        { name = 'treesitter' },
        { name = 'dap' }
    }),
    formatting = {
        format = lspkind.cmp_format({with_text = true, })
    },
    enabled = function ()
        return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt" or require("cmp_dap").is_dap_buffer()
    end,
} 

-- enable spellling suggestions
vim.opt.spelllang = { 'en_us' }


-- Setup lspconfig in lsp.lua
-- Setup autopairing in autoclosing.lua
