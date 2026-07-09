require("quarto").activate()

vim.api.nvim_create_autocmd('BufEnter', {
  callback = function()
    vim.opt.wrap = true
  end,
})

vim.api.nvim_create_autocmd('BufLeave', {
  callback = function()
    vim.opt.wrap = false
  end,
})
