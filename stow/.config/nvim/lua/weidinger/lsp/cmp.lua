vim.o.completeopt = "menu,menuone,noselect"

-- Setup nvim-cmp.
local cmp = require("cmp")
local lspkind = require("lspkind") -- Better iconography for completion
local compare = require("cmp.config.compare")

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        end,
    },
    mapping = {
        ["<C-p>"] = cmp.mapping.scroll_docs(-4),
        ["<C-n>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "vsnip" }, -- For vsnip users.
        { name = "buffer" },
        { name = "path" },
        { name = "spell" },
        { name = "calc" },
        { name = "treesitter" },
        { name = "dap" },
    }),
    formatting = {
        format = lspkind.cmp_format({
            mode = "symbol_text",
            menu = {
                buffer = "[Bff]",
                nvim_lsp = "[LSP]",
                vsnip = "[VSnp]",
                treesitter = "[]",
                spell = "[暈]",
                dap = "[DAP]",
                calc = "[]",
            },
        }),
    },
    sorting = {
        priority_weight = 2,
        comparators = {
            compare.offset,
            compare.exact,
            compare.score,
            compare.recently_used,
            compare.kind,
            compare.sort_text,
            compare.length,
            compare.order,
        },
    },
    enabled = function()
        return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt" or require("cmp_dap").is_dap_buffer()
    end,
})

-- enable spellling suggestions
vim.opt.spelllang = { "en_us" }
