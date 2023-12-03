local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

local keymap = vim.keymap

keymap.set("n", "<A-j>", function()
    harpoon:list():append()
end)
keymap.set("n", "<A-e>", function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
end)

keymap.set("n", "<A-f>", function()
    harpoon:list():select(1)
end)
keymap.set("n", "<A-d>", function()
    harpoon:list():select(2)
end)
keymap.set("n", "<A-s>", function()
    harpoon:list():select(3)
end)
keymap.set("n", "<A-a>", function()
    harpoon:list():select(4)
end)
