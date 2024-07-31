local telescope = require("telescope")
local trouble = require("trouble.sources.telescope")

telescope.setup({
    defaults = {
        mappings = {
            i = { ["<c-t>"] = trouble.open },
            n = { ["<c-t>"] = trouble.open },
        },
        file_ignore_patterns = { "^.git/" },
    },
    pickers = {
        find_all_files = {
            -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
        },
    },
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_cursor(),
        },
    },
})

telescope.load_extension("fzy_native")
telescope.load_extension("ui-select")

vim.keymap.set(
    "n",
    "<leader>ff",
    ":lua require'telescope.builtin'.find_files({ hidden = true, find_command = { 'rg', '--files', '--hidden', '--no-ignore-vcs', '--glob', '!{**/dist/*,**/node_modules/*,**/.git/*}' } })<cr>",
    { desc = "Find all files" }
)
vim.keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", { desc = "prev. opened" })
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope command_history<cr>", { desc = "prev. commands" })
vim.keymap.set("n", "<leader>f&", "<cmd>Telescope colorscheme<cr>", { desc = "avaliable colorschemes" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Grep" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help tags" })
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope reloader<cr>", { desc = "Reload modules" })
vim.keymap.set("n", "<leader>ft", "<cmd>Telescope tasks specs<cr>", { desc = "Tasks" })
vim.keymap.set("n", "<leader>fT", "<cmd>TodoTelescope<cr>", { desc = "Todos" })
vim.keymap.set("n", "<leader>fs", "<cmd>SessionManager load_session<cr>", { desc = "Load Session" })
