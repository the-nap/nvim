return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  keys = {
    {"<leader>gb", function() Snacks.git.blame_line() end, desc = "Git blame line"},
    {"<leader>lg", function() Snacks.lazygit() end, desc = "Lazygit"},
    {"<leader>n", function() Snacks.notifier.show_history() end, desc = "Show Notifications"},
  },
  opts = function()
    return require('plugins.snacks.config').opts
  end,
}
