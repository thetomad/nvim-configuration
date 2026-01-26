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


-- copy and paste to system clipboard

vim.opt.clipboard = "unnamedplus"

-- diagnostics

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
vim.o.signcolumn = "yes"
