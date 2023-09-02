local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local keymap = vim.keymap

keymap.set("n", "<A-j>", mark.add_file)
keymap.set("n", "<A-e>", ui.toggle_quick_menu)

keymap.set("n", "<A-f>", function()
    ui.nav_file(1)
end)
keymap.set("n", "<A-d>", function()
    ui.nav_file(2)
end)
keymap.set("n", "<A-s>", function()
    ui.nav_file(3)
end)
keymap.set("n", "<A-a>", function()
    ui.nav_file(4)
end)
