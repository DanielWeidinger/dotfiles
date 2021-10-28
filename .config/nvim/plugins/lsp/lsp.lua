local lspconfig = require'lspconfig'
local configs = require'lspconfig/configs'    
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.tsserver.setup{ capabilities = capabilities, }
lspconfig.pylsp.setup{capabilities = capabilities,}
lspconfig.dockerls.setup{capabilities = capabilities,}
lspconfig.bashls.setup{capabilities = capabilities,}

-- css
lspconfig.cssls.setup {
  capabilities = capabilities,
}

-- html
lspconfig.html.setup {
  capabilities = capabilities,
}

-- Emmet
if not lspconfig.emmet_ls then   
    configs.emmet_ls = {    
        default_config = {    
          cmd = {'emmet-ls', '--stdio'},
          filetypes = {'html', 'css'},
          root_dir = function(fname)    
            return vim.loop.cwd()
          end,        
          settings = {},    
        },    
    }    
end
lspconfig.emmet_ls.setup{ capabilities = capabilities }

-- JSON
lspconfig.jsonls.setup {
    capabilities = capabilities,
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
        end
      }
    }
}

