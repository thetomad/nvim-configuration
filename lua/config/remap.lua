vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)

vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = false })

-- terminal exit
vim.api.nvim_set_keymap("t", "jj", "<C-\\><C-n>", { noremap=false })

-- paranthesis
vim.api.nvim_set_keymap("i", "{", "{}<Left>", { noremap=false })
vim.api.nvim_set_keymap("i", "[", "[]<Left>", { noremap=false })
vim.api.nvim_set_keymap("i", "(", "()<Left>", { noremap=false })
