local M = {}
M.setup = function()
    require("session_manager").setup({
        autoload_mode = require("session_manager.config").AutoloadMode.Disabled, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
        autosave_ignore_filetypes = { -- All buffers of these file types will be closed before the session is saved.
            "gitcommit",
            "zsh",
        },
    })

    local config_group = vim.api.nvim_create_augroup("SessionGroup", {})
    vim.api.nvim_create_autocmd({ "User" }, {
        pattern = "SessionLoadPost",
        group = config_group,
        callback = function()
            --Set set Sway window class
            if os.getenv("XDG_CURRENT_DESKTOP") == "sway" then
                vim.opt.title = true
                local file_path_split = {}
                for i in string.gmatch(vim.loop.cwd(), "[^/]+") do
                    table.insert(file_path_split, i)
                end
                local title = "[" .. file_path_split[#file_path_split - 1] .. "] " .. file_path_split[#file_path_split]
                vim.opt.titlestring = title
            end

            -- Setup harpoon after session is loaded
            require("weidinger.UI.harpoon")
        end,
    })
end

return M
