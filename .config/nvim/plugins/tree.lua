vim.g["nvim_tree_group_empty"] = 1
require("nvim-tree").setup({
	update_cwd = true,
	diagnostics = {
		enable = false,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
})
