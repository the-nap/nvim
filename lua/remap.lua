vim.keymap.set("n", "<leader>w", "mzgg`z<cmd>w<CR>", { desc = "Format and save" })
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gl<Left><Left><Left>", { desc = "replace current word" })

vim.keymap.set("n", "<leader>ip", function()
  local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
  if venv ~= nil then
    venv = string.match(venv,"/.+/(.+)")
    vim.cmd(("MoltenInit %s"):format(venv))
  else
    vim.cmd("MoltenInit python3")
  end
end, { desc = "Initialize Molten for python3", silent = true })
