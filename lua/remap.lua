vim.keymap.set("n", "<leader>w", "mzgg=G`z<cmd>w<CR>", { desc = "Format and save" })
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gl<Left><Left><Left>", { desc = "replace current word" })
