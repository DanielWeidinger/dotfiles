-- Populate locallist with lsp diagnostics automatically
-- autocmd User LspDiagnosticsChanged :lua vim.diagnostic.set_loclist({open_loclist = false})

-- Local setting
vim.cmd([[autocmd FileType markdown setlocal wrap]])

-- Global settings
vim.cmd([[filetype plugin indent on]]) -- actiavtes filetype, the possibility to load plugins and the indent.vim plugin

-- Conda support
vim.g.python3_host_prog = vim.fn.trim(vim.fn.system("which python"))

-- navigation
local options = {
	relativenumber = true,
	number = true,
	scrolloff = 10, -- sets the scroll boarder 2*n lines more narrow
	encoding = "UTF-8",

	-- Styling
	termguicolors = true,

	-- show existing tab with 4 spaces width
	tabstop = 4,
	-- when indenting with '>', use 4 spaces width
	shiftwidth = 4,
	-- On pressing tab, insert 4 spaces
	expandtab = true,
	wrap = false,

	mouse = "n",

	-- Search
	hlsearch = false,
	incsearch = true, -- highlights the current search
	ignorecase = true,
	smartcase = true,

	hidden = true, -- keeps closed but unsaved buffers in the background

	-- misc
	signcolumn = "yes",
	exrc = true, -- additionally executes local rc config if present

	--commands
	showcmd = true,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
