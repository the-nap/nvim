return {
  'mason-org/mason-lspconfig.nvim',
  opts = {
    ensure_installed = {
      'lua_ls',
      'vtsls'
    },
  },
  dependencies = {
    'neovim/nvim-lspconfig',
    {
      'mason-org/mason.nvim',
      cmd = 'Mason',
      opts = {
        cmd = 'Mason',
        ui = {
          icons = {
            package_installed = '✓',
            package_pending = '➜',
            package_uninstalled = '✗',
          },
          check_outdated_packages_on_open = true,
          width = 0.8,
          height = 0.8,
        },
      },
    },
  },
}
