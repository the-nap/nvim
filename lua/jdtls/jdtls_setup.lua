local M = {}

function M.setup()
  local home = os.getenv('HOME')
  local status, jdtls = pcall(require, 'jdtls')
  if not status then
    return
  end

  local root_dir = require('jdtls.setup').find_root({ 'gradlew', 'mvnw', '.git' })
  if not root_dir then
    return
  end

  local project_name = vim.fn.fnamemodify(root_dir, ':p:h:t')
  local jdtls_root = home .. '/.local/share/nvim/mason/packages/jdtls/'
  local workspace_dir = home .. '/development/jdtls_data/' .. project_name
  local lombok_jar = jdtls_root .. 'lombok.jar'


  -- Additional capabilities

  local extendedClientCapabilities = jdtls.extendedClientCapabilities
  extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

  local config = {
    cmd = {
      'java',
      '-Declipse.application=org.eclipse.jdt.ls.core.id1',
      '-Dosgi.bundles.defaultStartLevel=4',
      '-Declipse.product=org.eclipse.jdt.ls.core.product',
      '-Dlog.level=ALL',
      '-Xmx1G',
      '--add-modules=ALL-SYSTEM',
      '--add-opens', 'java.base/java.util=ALL-UNNAMED',
      '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
      '-javaagent:' .. lombok_jar,
      '-jar', vim.fn.glob(jdtls_root .. 'plugins/org.eclipse.equinox.launcher_*.jar'),
      '-configuration', jdtls_root .. 'config_linux',
      '-data', workspace_dir,
    },
    root_dir = root_dir,
    settings = {
      java = {
        signatureHelp = { enabled = true },
        extendedClientCapabilities = extendedClientCapabilities,
        configuration = {
          configuration = { updateBuildConfiguration = 'interactive' },
          maven = { downloadSources = true },
          lombok = { lombokEnabled = true },
        },
      },
    },
    init_options = {},
  }

  jdtls.start_or_attach(config)
end

return M
