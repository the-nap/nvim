vim.keymap.set("n", "<leader>ip", function()
  local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
  if venv ~= nil then
    venv = string.match(venv,"/.+/(.+)")
    vim.cmd(("MoltenInit %s"):format(venv))
  else
    vim.cmd("MoltenInit python3")
  end
end, { desc = "Initialize Molten for python3", silent = true })

vim.keymap.set("n", "<localleader>e", ":MoltenEvaluateOperator<CR>", { desc = "evaluate operator", silent = true })
vim.keymap.set("n", "<localleader>os", ":noautocmd MoltenEnterOutput<CR>", { desc = "open output window", silent = true })


vim.g.molten_auto_open_output = false

vim.g.molten_image_provider = "image.nvim"

vim.g.molten_wrap_output = true

vim.g.molten_virt_text_output = true

vim.g.molten_virt_lines_off_by_1 = true
