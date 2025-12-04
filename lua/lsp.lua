local keymap = vim.keymap
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local opts = { buffer = ev.buf, silent = true }

    opts.desc = "Show line diagnostics"
    keymap.set("n", "<leader>d ", vim.diagnostic.open_float, opts)

    opts.desc = "Show LSP references"
    keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

    opts.desc = "Go to declaration"
    keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

    opts.desc = "Show LSP definition"
    keymap.set("n", "gd", vim.lsp.buf.definition, opts)

    opts.desc = "Show LSP implementation"
    keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

    opts.desc = "See available code actions"
    keymap.set({"n","v"}, "<leader>ca", vim.lsp.buf.code_action, opts)

    opts.desc = "Smart rename"
    keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

    opts.desc = "Restart LSP"
    keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)

    opts.desc = "Show documentation for what ir under cursor"
    keymap.set("n","K", vim.lsp.buf.hover, opts)

  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'java',
  callback = function (args)
    require'jdtls.jdtls_setup'.setup()
  end
})
