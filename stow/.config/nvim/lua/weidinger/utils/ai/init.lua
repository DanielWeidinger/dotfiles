-- GPT
local chatgpt = require("chatgpt")
chatgpt.setup({
    popup_input = {
        submit = "<cr>",
    },
    actions_paths = { vim.fn.stdpath("config") .. "/lua/weidinger/utils/ai/actions.json" },
})

require("llm").setup({
    url = "https://api.openai.com/v1/chat/completions",
    model = "gpt-4o-mini",
    api_type = "openai",
    keys = {
        -- The keyboard mapping for the input window.
        ["Input:Submit"] = { mode = { "n", "i" }, key = "<cr>" },
        ["Input:HistoryNext"] = { mode = { "n", "i" }, key = "<C-j>" },
        ["Input:HistoryPrev"] = { mode = { "n", "i" }, key = "<C-k>" },
    },
    app_handler = {
        WordTranslate = {
            handler = "flexi_handler",
            prompt = [[You are a translation expert. Your task is to translate all the text provided by the user into English.

NOTE:
- All the text input by the user is part of the content to be translated, and you should ONLY FOCUS ON TRANSLATING THE TEXT without performing any other tasks.
- RETURN ONLY THE TRANSLATED RESULT.]],
            opts = {
                exit_on_move = true,
                enter_flexible_window = false,
                enable_cword_context = true,
            },
        },
        AttachToChat = {
            handler = "attach_to_chat_handler",
            opts = {
                is_codeblock = true,
                inline_assistant = true,
                diagnostic = { vim.diagnostic.severity.ERROR, vim.diagnostic.severity.WARN },
                -- display diff
                display = {
                    mapping = {
                        mode = "n",
                        keys = { "d" },
                    },
                    action = nil,
                },
                -- accept diff
                accept = {
                    mapping = {
                        mode = "n",
                        keys = { "Y", "y" },
                    },
                    action = nil,
                },
                -- reject diff
                reject = {
                    mapping = {
                        mode = "n",
                        keys = { "N", "n" },
                    },
                    action = nil,
                },
                -- close diff
                close = {
                    mapping = {
                        mode = "n",
                        keys = { "<esc>" },
                    },
                    action = nil,
                },
            },
        },
        Ask = {
            handler = "disposable_ask_handler",
            opts = {
                position = {
                    row = 2,
                    col = 0,
                },
                title = " Ask ",
                -- inline_assistant = true,

                -- Whether to use the current buffer as context without selecting any text (the tool is called in normal mode)
                enable_buffer_context = true,
                diagnostic = { vim.diagnostic.severity.ERROR, vim.diagnostic.severity.WARN },

                -- display diff
                display = {
                    mapping = {
                        mode = "n",
                        keys = { "d" },
                    },
                    action = nil,
                },
                -- accept diff
                accept = {
                    mapping = {
                        mode = "n",
                        keys = { "Y", "y" },
                    },
                    action = nil,
                },
                -- reject diff
                reject = {
                    mapping = {
                        mode = "n",
                        keys = { "N", "n" },
                    },
                    action = nil,
                },
                -- close diff
                close = {
                    mapping = {
                        mode = "n",
                        keys = { "<esc>" },
                    },
                    action = nil,
                },
            },
        },
    },

    web_search = {
        url = "https://api.tavily.com/search",
        fetch_key = vim.env.TAVILY_TOKEN,
        params = {
            auto_parameters = false,
            topic = "general",
            search_depth = "basic",
            chunks_per_source = 3,
            max_results = 3,
            include_answer = true,
            include_raw_content = true,
            include_images = false,
            include_image_descriptions = false,
            include_favicon = false,
        },
    },
})

vim.keymap.set({ "n", "v" }, "<leader>aa", ":LLMSessionToggle<cr>", { desc = "Launch (GPT)" })
vim.keymap.set({ "n", "v" }, "<leader>aA", ":LLMAppHandler AttachToChat<cr>", { desc = "Launch (GPT)" })
vim.keymap.set({ "n", "v" }, "<leader>ae", ":LLMAppHandler Ask<cr>", { desc = "Edit with instructions (GPT)" })
vim.keymap.set({ "n", "v" }, "<leader>ag", ":ChatGPTRun grammar_correction<cr>", { desc = "Grammar English (GPT)" })
vim.keymap.set({ "n", "v" }, "<leader>at", ":ChatGPTRun latex_correction<cr>", { desc = "German (GPT)" })
