local M = {}

local utils = require("weidinger.UI.toggleterm.utils")
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
local defMappings = { "n", "v", "i", "t" }

M.setup = function(state)
    keymap(defMappings, "<F1>", function()
        if state.currentDirection == "float" then
            if vim.tbl_isempty(state.termsInUse) then
                state.latestTerm = 1
            end
            utils.toggleCmd(state.currentDirection, state.latestTerm)
        else
            utils.toggleCmd(state.currentDirection, 1)
        end
    end, opts)
    keymap(defMappings, "<F2>", function()
        -- Float
        if state.currentDirection == "float" then
            if vim.tbl_isempty(state.termsInUse) then
                return utils.toggleCmd(state.currentDirection, 1)
            end
            local idx = utils.getIdx(state.termsInUse, state.latestTerm)
            local nextIdx = (idx + 1) % (#state.termsInUse + 1)
            local idxToUse = nextIdx == 0 and 1 or nextIdx
            utils.toggleCmd(state.currentDirection, state.termsInUse[idxToUse])
        else
            utils.toggleCmd(state.currentDirection, 2)
        end
    end, opts)
    keymap(defMappings, "<F3>", function()
        -- Float
        if state.currentDirection == "float" then
            if vim.tbl_isempty(state.termsInUse) then
                return utils.toggleCmd(state.currentDirection, 1)
            end
            local idx = utils.getIdx(state.termsInUse, state.latestTerm)
            local prevIdx = (idx - 1) % (#state.termsInUse + 1)
            local idxToUse = prevIdx == 0 and #state.termsInUse or prevIdx
            utils.toggleCmd(state.currentDirection, state.termsInUse[idxToUse])
        else
            utils.toggleCmd(state.currentDirection, 3)
        end
    end, opts)
    keymap(defMappings, "<F4>", function()
        if state.currentDirection == "float" then
            if vim.tbl_isempty(state.termsInUse) then
                return utils.toggleCmd(state.currentDirection, 1)
            end
            local nextTermIdx = state.termsInUse[#state.termsInUse]
            utils.toggleCmd(state.currentDirection, state.termsInUse[nextTermIdx] + 1)
        else
            utils.toggleCmd(state.currentDirection, 4)
        end
    end, opts)
end
return M
