local status_ok, jupyter = pcall(require, "jupyter_ascending")
if not status_ok then
    return
end

jupyter.setup({
    default_mappings = false,
    -- global uv tool (scripts/install_jupyter_ascending.sh server) holds both client and notebook server
    python_executable = vim.fn.expand("~/.local/share/uv/tools/notebook/bin/python"),
})

vim.keymap.set("n", "<leader>jj", jupyter.execute, { desc = "Execute cell" })
vim.keymap.set("n", "<leader>ja", jupyter.execute_all, { desc = "Execute all cells" })
vim.keymap.set("n", "<leader>jr", jupyter.restart, { desc = "Restart Kernel" })
vim.keymap.set("n", "<leader>ji", jupyter.interrupt, { desc = "Interrupt Kernel" })
vim.keymap.set("n", "<leader>js", jupyter.start_server, { desc = "Start notebook server" })
vim.keymap.set("n", "<leader>jS", jupyter.stop_server, { desc = "Stop notebook server" })
