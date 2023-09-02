local function add_mappings(force_3f)
    for _, _1_ in ipairs({
        { { "n", "x", "o" }, "ü", "<Plug>(leap-forward-to)", "Leap forward to" },
        { { "n", "x", "o" }, "Ü", "<Plug>(leap-backward-to)", "Leap backward to" },
        { { "n", "x", "o" }, "gü", "<Plug>(leap-from-window)", "Leap from window" },
        { { "n", "x", "o" }, "gü", "<Plug>(leap-cross-window)", "Leap from window" },
    }) do
        local _each_2_ = _1_
        local modes = _each_2_[1]
        local lhs = _each_2_[2]
        local rhs = _each_2_[3]
        local desc = _each_2_[4]
        for _0, mode in ipairs(modes) do
            if force_3f or ((vim.fn.mapcheck(lhs, mode) == "") and (vim.fn.hasmapto(rhs, mode) == 0)) then
                vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
            else
            end
        end
    end
    return nil
end

add_mappings()
