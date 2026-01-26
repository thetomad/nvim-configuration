
-- Register config (so :LspInfo recognizes it)
vim.lsp.config("pyright", {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = {
    "pyproject.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    "Pipfile",
    ".git",
  },
})

local root_markers = {
  "pyproject.toml",
  "setup.py",
  "setup.cfg",
  "requirements.txt",
  "Pipfile",
  ".git",
}

vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function(args)
    local langserver = vim.fn.exepath("pyright-langserver")
    if langserver == "" then
      vim.notify("pyright-langserver not found. Install: sudo pacman -S pyright", vim.log.levels.ERROR)
      return
    end

    local root = vim.fs.root(args.buf, root_markers) or vim.fn.getcwd()

    -- Avoid starting a second client for the same root
    for _, client in ipairs(vim.lsp.get_clients({ name = "pyright" })) do
      if client.config and client.config.root_dir == root then
        if not vim.lsp.buf_is_attached(args.buf, client.id) then
          vim.lsp.buf_attach_client(args.buf, client.id)
        end
        return
      end
    end

    vim.lsp.start({
      name = "pyright",
      cmd = { langserver, "--stdio" },
      root_dir = root,
    })
  end,
})
