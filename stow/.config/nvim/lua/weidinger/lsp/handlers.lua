local M = {}

M.on_attach_format = function(client, bufnr)
    require("lsp-format").on_attach(client)
end

return M
