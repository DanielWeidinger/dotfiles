-- Top Line
local cokeline = require("cokeline")
local rq_get_hex = require("cokeline/utils").get_hex
-- local rq_palette = require("colorscheme").palette
local rq_mappings = require("cokeline/mappings")

local comments_fg = rq_get_hex("Comment", "fg")
local errors_fg = rq_get_hex("DiagnosticError", "fg")
local warnings_fg = rq_get_hex("DiagnosticWarn", "fg")

local components = {
    space = {
        text = " ",
        truncation = { priority = 1 },
    },

    two_spaces = {
        text = "  ",
        truncation = { priority = 1 },
    },

    separator = {
        text = function(buffer)
            return buffer.index ~= 1 and "▏" or ""
        end,
    },

    devicon = {
        text = function(buffer)
            return (rq_mappings.is_picking_focus() or rq_mappings.is_picking_close()) and buffer.pick_letter .. " "
                or buffer.devicon.icon
        end,
        fg = function(buffer)
            return buffer.devicon.color
        end,
        style = function(_)
            return (rq_mappings.is_picking_focus() or rq_mappings.is_picking_close()) and "italic,bold" or nil
        end,
    },

    index = {
        text = function(buffer)
            return buffer.index .. ": "
        end,
        hl = {
            fg = function(buffer)
                return (buffer.diagnostics.errors ~= 0 and errors_fg)
                    or (buffer.diagnostics.warnings ~= 0 and warnings_fg)
                    or nil
            end,
        },
    },

    unique_prefix = {
        text = function(buffer)
            return buffer.unique_prefix
        end,
        hl = {
            fg = comments_fg,
            style = "italic",
        },
        truncation = {
            priority = 7,
            direction = "left",
        },
    },

    filename = {
        text = function(buffer)
            return buffer.filename
        end,
        hl = {
            fg = function(buffer)
                return (not buffer.is_focused and buffer.diagnostics.errors ~= 0 and errors_fg)
                    or (not buffer.is_focused and buffer.diagnostics.warnings ~= 0 and warnings_fg)
                    or nil
            end,
            style = function(buffer)
                return ((buffer.is_focused and buffer.diagnostics.errors ~= 0) and "bold,underline")
                    or (buffer.is_focused and "bold")
                    or (buffer.diagnostics.errors ~= 0 and "underline")
                    or nil
            end,
        },
        truncation = {
            priority = 6,
            direction = "left",
        },
    },

    diagnostics = {
        text = function(buffer)
            return (buffer.diagnostics.errors ~= 0 and " " .. LspSigns.Error .. " " .. buffer.diagnostics.errors)
                or (buffer.diagnostics.warnings ~= 0 and " " .. LspSigns.Warn .. " " .. buffer.diagnostics.warnings)
                or ""
        end,
        fg = function(buffer)
            return (buffer.diagnostics.errors ~= 0 and errors_fg)
                or (buffer.diagnostics.warnings ~= 0 and warnings_fg)
                or nil
        end,
        truncation = { priority = 2 },
    },

    close_or_unsaved = {
        text = function(buffer)
            return buffer.is_modified and "●" or ""
        end,
        -- hl = {
        -- 	fg = function(buffer)
        -- 		return buffer.is_modified and rq_palette.normal.green or nil
        -- 	end,
        -- },
        delete_buffer_on_left_click = true,
        truncation = { priority = 5 },
    },
}

cokeline.setup({
    mappings = {
        cycle_prev_next = true,
    },
    default_hl = {
        fg = function(buffer)
            return buffer.is_focused and rq_get_hex("Normal", "fg") or rq_get_hex("Comment", "fg")
        end,
        bg = function(buffer)
            return buffer.is_focused and rq_get_hex("ColorColumn", "bg")
        end,
    },
    buffers = {
        filter_visible = function(buffer)
            return buffer.type ~= "terminal" and buffer.type ~= "dap-repl"
        end,
        new_buffers_position = "next",
    },
    rendering = {
        max_buffer_width = 30,
    },
    components = {
        components.separator,
        components.space,
        components.devicon,
        -- components.space,
        -- components.index,
        components.unique_prefix,
        components.filename,
        components.diagnostics,
        components.two_spaces,
        components.close_or_unsaved,
        components.space,
    },
})

-- Bindings

local map = vim.api.nvim_set_keymap
map("n", "<S-Tab>", "<Plug>(cokeline-focus-prev)", { silent = true })
map("n", "<Tab>", "<Plug>(cokeline-focus-next)", { silent = true })

local switch_mappings = { name = "Tabline" }
for i = 1, 9 do
    switch_mappings[("%s"):format(i)] = { ("<Plug>(cokeline-switch-%s)"):format(i), "which_key_ignore" }
end

local wk = require("which-key")

wk.register(switch_mappings, { prefix = "<leader>" })
wk.register({
    n = { "<Plug>(cokeline-switch-next)", "Bufnext" },
    N = { "<Plug>(cokeline-switch-prev)", "Bufprev" },
    -- b = { "<Plug>(cokeline-pick-focus)", "Buf pick focus" },
}, {
    prefix = "<leader>",
})
