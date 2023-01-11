local M = {}

M.getIdx = function(termsInUse, search)
    for i, value in ipairs(termsInUse) do
        if value == search then
            return i
        end
    end
end

M.getNextFreeId = function(termsInUse)
    local c = 1
    if vim.tbl_isempty(termsInUse) then
        return c
    end

    for i, value in ipairs(termsInUse) do
        if value ~= c then
            return c
        end
        c = c + 1
    end
    return c
end

M.toggleTerm = function(currentDirection, termId)
    local cmdStr = termId .. "ToggleTerm direction=" .. currentDirection
    vim.cmd(cmdStr)
end

M.execTermWithCmd = function(currentDirection, termId, cmd)
    local cmdStr = termId .. "TermExec direction=" .. currentDirection .. [[ cmd="]] .. cmd .. [["]]
    vim.cmd(cmdStr)
end

return M
