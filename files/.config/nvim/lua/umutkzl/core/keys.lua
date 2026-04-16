-- Buffers
vim.keymap.set("n", "<leader>bh", "<cmd>bprevious<cr>", { desc = "Previous Buffer" })
vim.keymap.set("n", "<leader>bl", "<cmd>bnext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete Buffer" })

-- Easier end or start line
vim.keymap.set("n", "H", "0", { desc = "Start of the line" })
vim.keymap.set("n", "L", "$", { desc = "End of the line" })

-- Easier navigation between splits (normal mode and terminal mode)
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Left split" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Bottom split" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Up split" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Right split" })

vim.keymap.set("t", "<C-h>", "<C-w><C-h>", { desc = "Left split" })
vim.keymap.set("t", "<C-j>", "<C-w><C-j>", { desc = "Bottom split" })
vim.keymap.set("t", "<C-k>", "<C-w><C-k>", { desc = "Up split" })
vim.keymap.set("t", "<C-l>", "<C-w><C-l>", { desc = "Right split" })

-- Format buffer
vim.keymap.set("n", "<leader>lf", function()
	vim.lsp.buf.format()
end, { desc = "Format the file" })
