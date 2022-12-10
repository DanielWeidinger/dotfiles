local M = {}

M.on_attach = function(client, bufnr)
	require("lsp-format").on_attach(client)
end

return M
