local M = {}

M.getIdx = function(termsInUse, search)
    for i, value in ipairs(termsInUse) do
        if value == search then
            return i
        end
    end
end

M.toggleCmd = function(currentDirection, termId)
    local cmdStr = termId .. "ToggleTerm direction=" .. currentDirection
    vim.cmd(cmdStr)
end

return M
