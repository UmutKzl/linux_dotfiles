-- NOTE: This file only has non-plugin keymaps. If you want to change
-- a plugin's keymap, go to /lua/plugins directory and find plugin there.

vim.keymap.set("n", "<leader>qu", "<cmd>%s/'/\"/g<cr>", { silent = true, desc = "Make all single quotes double" })

vim.keymap.set("n", "H", "<cmd>bprevious<cr>", { silent = true, desc = "Previous Buffer" })
vim.keymap.set("n", "L", "<cmd>bnext<cr>", { silent = true, desc = "Next Buffer" })
vim.keymap.set("n", "JK", "<cmd>bdelete<cr>", { silent = true, desc = "Close Buffer" })
