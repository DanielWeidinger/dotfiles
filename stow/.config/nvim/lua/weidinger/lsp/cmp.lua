vim.o.completeopt = "menu,menuone,noselect"

-- Setup nvim-cmp.
local cmp = require("cmp")
local lspkind = require("lspkind") -- Better iconography for completion
local compare = require("cmp.config.compare")
local context = require("cmp.config.context")

local border_opts = { border = "single" }
cmp.setup({
    window = {
        completion = cmp.config.window.bordered(border_opts),
        documentation = cmp.config.window.bordered(border_opts),
    },
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
        { name = "treesitter" },
        { name = "dap" },
    }),
    formatting = {
        format = lspkind.cmp_format({
            mode = "symbol_text",
            menu = {
                buffer = "[Buf]",
                nvim_lsp = "[LSP]",
                vsnip = "[VSnp]",
                treesitter = "[]",
                dap = "[DAP]",
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
        -- disable completion in comments
        -- keep command mode completion enabled when cursor is in a comment
        local in_command_mode = vim.api.nvim_get_mode().mode == "c"
        local is_not_comment = (not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment"))
            or in_command_mode

        local other_conditions = vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
            or require("cmp_dap").is_dap_buffer()
        local is_not_chatgpt_input = vim.bo.filetype ~= "chatgpt-input"
        return is_not_comment and other_conditions and is_not_chatgpt_input
    end,
})
-- `:` cmdline setup.
cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "path" },
    }, {
        {
            name = "cmdline",
            option = {
                ignore_cmds = { "Man", "!" },
            },
        },
    }),
})

-- enable spellling suggestions
vim.opt.spelllang = { "en_us" }
