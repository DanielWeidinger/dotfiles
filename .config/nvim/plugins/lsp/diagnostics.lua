local lspconfig = require'lspconfig'
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local eslint = {
  lintCommand = 'eslint_d -f unix --stdin --stdin-filename ${INPUT}',
  lintIgnoreExitCode = true,
  lintStdin = true,
  lintFormats = { '%f:%l:%c: %m' },
  formatCommand = 'eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}',
  formatStdin = true,
}
local prettier = { formatCommand = 'prettier_d_slim --stdin --stdin-filepath ${INPUT}', formatStdin = true }
local lua_format = {
                {
                    formatCommand = "lua-format -i --no-keep-simple-function-one-line --no-break-after-operator --column-limit=150 --break-after-table-lb",
                    formatStdin = true
                }
            }

local format_config = {
  css = { prettier },
  html = { prettier },
  javascript = { prettier, eslint },
  javascriptreact = { prettier, eslint },
  json = { prettier },
  lua = { lua_format },
  markdown = { prettier },
  scss = { prettier },
  typescript = { prettier, eslint },
  typescriptreact = { prettier, eslint },
  yaml = { prettier },
}

lspconfig.efm.setup {
      capabilities = capabilities,
      on_attach=on_attach,
      filetypes = vim.tbl_keys(format_config),
      init_options = { documentFormatting = true },
      root_dir = lspconfig.util.root_pattern { '.git/', "package.json", ".prettierrc", },
      settings = { languages = format_config },
}
