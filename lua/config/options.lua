vim.opt.number = true
vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4

-- when open terminal buffer, start terminal

vim.api.nvim_create_autocmd("TermOpen", {
    callback = function()
	vim.cmd "startinsert!"
    end,
})

