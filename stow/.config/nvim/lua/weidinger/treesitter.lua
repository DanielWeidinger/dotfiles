require("nvim-treesitter").setup()

vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        -- Enable treesitter highlighting and disable regex syntax
        pcall(vim.treesitter.start)
        -- -- Enable treesitter-based indentation
        -- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
})

local ensureInstalled = {
    "tsx",
    "typescript",
    "javascript",
    "python",
    "json",
    "yaml",
    "html",
    "scss",
    "php",
    "lua",
    "markdown",
    "markdown_inline",
    "cpp",
    "c_sharp",
}
local alreadyInstalled = require("nvim-treesitter.config").get_installed()
local parsersToInstall = vim.iter(ensureInstalled)
    :filter(function(parser)
        return not vim.tbl_contains(alreadyInstalled, parser)
    end)
    :totable()
require("nvim-treesitter").install(parsersToInstall)
