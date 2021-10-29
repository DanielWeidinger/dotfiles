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
local format_config = {
  css = { prettier },
  html = { prettier },
  javascript = { prettier, eslint },
  javascriptreact = { prettier, eslint },
  json = { prettier },
  -- lua = { stylua },
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
      root_dir = lspconfig.util.root_pattern { '.git/', '.', "package.json" },
      settings = { languages = format_config },
}


-- local filetypes = {
--     typescript = "eslint",
--     typescriptreact = "eslint",
-- }
-- local linters = {
--     eslint = {
--         sourceName = "eslint",
--         command = "eslint_d",
--         rootPatterns = {".eslintrc.js", "package.json"},
--         debounce = 100,
--         args = {"--stdin", "--stdin-filename", "%filepath", "--format", "json"},
--         parseJson = {
--             errorsRoot = "[0].messages",
--             line = "line",
--             column = "column",
--             endLine = "endLine",
--             endColumn = "endColumn",
--             message = "${message} [${ruleId}]",
--             security = "severity"
--         },
--         securities = {[2] = "error", [1] = "warning"}
--     }
-- }
-- local formatters = {
--     prettier = {command = "prettier", args = {"--stdin-filepath", "%filepath"}}
-- }
-- local formatFiletypes = {
--     typescript = "prettier",
--     typescriptreact = "prettier"
-- }
-- lspconfig.diagnosticls.setup {
--     on_attach = on_attach,
--     filetypes = vim.tbl_keys(filetypes),
--     init_options = {
--         filetypes = filetypes,
--         linters = linters,
--         formatters = formatters,
--         formatFiletypes = formatFiletypes
--     }
-- }

-- lspconfig.diagnosticls.setup {
--   capabilities = capabilities,
--   on_attach = on_attach,
--   filetypes = { 'javascript', 'javascriptreact', 'json', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'markdown', 'pandoc' },
--   init_options = {
--     linters = {
--       eslint = {
--         command = 'eslint_d',
--         rootPatterns = { '.git' },
--         debounce = 100,
--         args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
--         sourceName = 'eslint_d',
--         parseJson = {
--           errorsRoot = '[0].messages',
--           line = 'line',
--           column = 'column',
--           endLine = 'endLine',
--           endColumn = 'endColumn',
--           message = '[eslint] ${message} [${ruleId}]',
--           security = 'severity'
--         },
--         securities = {
--           [2] = 'error',
--           [1] = 'warning'
--         }
--       },
--     },
--     filetypes = {
--       javascript = 'eslint',
--       javascriptreact = 'eslint',
--       typescript = 'eslint',
--       typescriptreact = 'eslint',
--     },
--     formatters = {
--       eslint_d = {
--         command = 'eslint_d',
--         args = { '--stdin', '--stdin-filename', '%filename', '--fix-to-stdout' },
--         rootPatterns = { '.git' },
--       },
--       prettier = {
--         command = 'prettier',
--         args = { '--stdin-filepath', '%filename' }
--       }
--     },
--     formatFiletypes = {
--       css = 'prettier',
--       javascript = 'eslint_d',
--       javascriptreact = 'eslint_d',
--       json = 'prettier',
--       scss = 'prettier',
--       less = 'prettier',
--       typescript = 'eslint_d',
--       typescriptreact = 'eslint_d',
--       json = 'prettier',
--       markdown = 'prettier',
--     }
--   }
-- }
