local M = {}

function M.setup()
  local home = os.getenv('HOME')

  -- If you started neovim within `~/dev/xy/project-1` this would resolve to `project-1`
  local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
  local jdtls_root = home .. '/.local/share/nvim/mason/packages/jdtls/'

  local workspace_dir = home .. '/development/jdtls_data/' .. project_name
  local lombok_jar = jdtls_root .. 'lombok.jar'

  local status, jdtls = pcall(require, 'jdtls')
  if not status then
    return
  end

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
      '--add-opens',
      'java.base/java.util=ALL-UNNAMED',
      '--add-opens',
      'java.base/java.lang=ALL-UNNAMED',

      --lombok
      '-javaagent:' .. lombok_jar,


      "-jar",
      vim.fn.glob(jdtls_root .. 'plugins/org.eclipse.equinox.launcher_*.jar'),
      --                           ^^^^^^^^^^ 
      -- points to the eclipse.jdt.ls installation

      "-configuration",
      jdtls_root .. 'config_linux',
      --              ^^^^^^^^^^
      -- needs to know your os


      -- needs some place to store index data for each project it loads
      -- you don't want it to decide by himself
      '-data', workspace_dir,

    },

    -- root_dir points to root of project, it is identified by the presence of one of those files
    root_dir = vim.fs.root(0, {'gradlew', '.git', 'mvnw'}),

    -- can configure jdtls for specific needs, can cry here later
    settings = {
      java = {
        signatureHelp = {
          enabled = true
        },
        extendedClientCapabilities = extendedClientCapabilities,
        configuration = {
          configuration = {
            updateBuildConfiguration = "interactive",
          },
          maven = {
            downloadSources = true,
          },
          lombok = {
            lombokEnabled = true,
          }
        }
      },
    },

      -- same but with initialization options, like debugger
      init_options = {
      },
    }

  -- Start or attach already existent client and server
  require('jdtls').start_or_attach(config)
end

return M
