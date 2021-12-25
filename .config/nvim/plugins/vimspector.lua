local wk = require("which-key")
wk.register({
	d = {
		name = "Debug", -- optional group name
		d = { ":call vimspector#Launch()<cr>", "Launch" },
		c = { ":call GotoWindow(g:vimspector_session_windows.code)<cr>", "GT:Code" },
		t = { ":call GotoWindow(g:vimspector_session_windows.tagpage)<cr>", "GT:Tag" },
		v = { ":call GotoWindow(g:vimspector_session_windows.variables)<cr>", "GT:Vars" },
		w = { ":call GotoWindow(g:vimspector_session_windows.watches)<cr>", "GT:Watches" },
		s = { ":call GotoWindow(g:vimspector_session_windows.StackTrace)<cr>", "GT:Stacktrace" },
		o = { ":call GotoWindow(g:vimspector_session_windows.output)<cr>", "GT:Ouput" },
		e = { ":call vimspector#Reset()<cr>", "Reset" },
		B = { ":call vimspector#CleanLineBreakpoint()<cr>", "◯ :Clean" },
		l = { "<Plug>VimspectorStepInto<cr>", "Into" },
		j = { "<Plug>VimspectorStepOver<cr>", "Over" },
		k = { "<Plug>VimspectorStepOut<cr>", "Out" },
		_ = { "<Plug>VimspectorStepRestart<cr>", "StepRestart" },
		["<leader>"] = { ":call vimspector#Continue()<CR>", "Continue<cr>" },
		r = { "<Plug>VimspectorRunToCursor<cr>", "ToCursor" },
		b = { ":call vimspector#ToggleBreakpoint()<cr>", "◯ :Toggle" },
		C = { ":call vimspector#ToggleBreakpoint( { trigger expr, hit count expr } )<cr>", "◯ :Condidional" },
		i = { "<Plug>VimspectorBalloonEval<cr>", "ShowVar" },
	},
}, {
	prefix = "<leader>",
})

vim.g["vimspector_base_dir"] = vim.fn.expand("$HOME/.config/nvim/vimspector")

-- UI and functionality customizations

-- Autoclosing of execution output terminal
vim.api.nvim_exec(
	[[
fun! CloseDebuggingTermBuf()
    echom "Enter function"
    let l:tabInfo = gettabinfo(g:vimspector_session_windows.tabpage)[0]
    echom tabInfo
    for l:winid in tabInfo.windows
        let l:currWin = getwininfo(l:winid)[0]
        if l:currWin.terminal
            echom "Terminal found: " . currWin.bufnr
            augroup custom_vimspector
                autocmd!
                execute "autocmd TabClosed " . g:vimspector_session_windows.tabpage . " bwipeout " . currWin.bufnr
            augroup END
            break
        endif
    endfor
endfun
]],
	false
)
vim.api.nvim_exec("autocmd User VimspectorTerminalOpened call CloseDebuggingTermBuf()", false)
