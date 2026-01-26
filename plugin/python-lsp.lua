
-- ~/.config/nvim/plugin/python-lsp.lua

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

    -- Reuse an existing pyright client for this root if it already exists
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
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "basic", 
          },
        },
      },
    })
  end,
})
