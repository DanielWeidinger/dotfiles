local Task = require("tasks.lib.task")
local tasks = require("tasks")

local source_npm = require("tasks.sources.npm")
local source_tasksjson = require("tasks.sources.tasksjson")
local builtin = require("tasks.sources.builtin")

require("telescope").load_extension("tasks")

local toggleterm = require("weidinger.UI.toggleterm")
local create_run_toggleterm_fn = function(cmd_list)
    local cmd = vim.fn.join(cmd_list)
    return function()
        toggleterm.open_in_unused(cmd)
        -- vim.cmd([[:5TermExec direction="float" cmd="]] .. cmd .. [["]])
    end
end

tasks.setup({
    runners = {
        floaterm_runner = {
            create_task = function(self, spec, args)
                return Task:new(create_run_toggleterm_fn(spec.cmd), args)
            end,
        },
    },
    sources = {
        npm = source_npm,
        vscode = source_tasksjson,
    },
    router = function(spec_name, spec, args, source_name)
        if source_name == "npm" then
            return "floaterm_runner"
        end
        return nil -- fallback to use the default router value
    end,
})
