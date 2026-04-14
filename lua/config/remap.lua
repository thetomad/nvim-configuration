vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)

vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = false })

-- terminal exit
vim.api.nvim_set_keymap("t", "jj", "<C-\\><C-n>", { noremap=false })

-- paranthesis
vim.api.nvim_set_keymap("i", "{", "{}<Left>", { noremap=false })
vim.api.nvim_set_keymap("i", "[", "[]<Left>", { noremap=false })
vim.api.nvim_set_keymap("i", "(", "()<Left>", { noremap=false })


-- gen.lua
vim.keymap.set({ 'n', 'v' }, '<leader>gc', ':Gen Chat<CR>')
vim.keymap.set({ 'n', 'v' }, '<leader>ga', ':Gen Ask<CR>')
vim.keymap.set({ 'n', 'v' }, '<leader>gg', ':Gen<CR>')
