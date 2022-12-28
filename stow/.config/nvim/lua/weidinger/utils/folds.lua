local M = {}

M.toggle_ts_folding = function()
    local opt = vim.opt
    if opt.foldmethod._value and opt.foldmethod._value == "expr" then
        print("Undo Ts Folding")
        opt.foldmethod = "manual"
        opt.foldexpr = nil
        vim.cmd([[call feedkeys("zE")]])
    else
        print("Ts Folding")
        opt.foldmethod = "expr"
        opt.foldexpr = "nvim_treesitter#foldexpr()"
    end
end

return M
