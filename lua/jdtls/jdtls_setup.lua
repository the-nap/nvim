local M = {}

function M:setup()
  -- If you started neovim within `~/dev/xy/project-1` this would resolve to `project-1`
  local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

  local workspace_dir = '/home/thecoder_/development/jdtls_data' .. project_name

  local config = {
    cmd = {
      "java", --no jdk specifically needed because jdk 25 is the only one installed

      -- random shit eclipse wants me to write
      "-Declipse.application=org.eclipse.jdt.ls.core.id1",
      "-Dosgi.bundles.defaultStartLevel=4",
      "-Declipse.product=org.eclipse.jdt.ls.core.product",
      "-Dlog.level=ALL",
      "-Xmx1G",
      "--add-modules=ALL-SYSTEM",
      "--add-opens java.base/java.util=ALL-UNNAMED",
      "--add-opens java.base/java.lang=ALL-UNNAMED",
      -- end of random shit


      "-jar",
      "/home/thecoder_/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.7.100.v20251111-0406.jar",
      --  ^^^^^^^^^^ 
      -- points to the eclipse.jdt.ls installation

      "-configuration",
      "/home/thecoder_/.local/share/nvim/mason/packages/jdtls/config_linux",
      --  ^^^^^^^^^^                                               ^^^^^^^^^^^
      -- points to eclips.jdt.ls installation                  needs to know your os


      -- needs some place to store index data for each project it loads
      -- you don't want it to decide by himself
      '-data', workspace_dir,
    },

    -- root_dir points to root of project, it is identified by the presence of one of those files
    root_dir = vim.fs.root(0, {'gradlew', '.git', 'mvnw'}),

    -- can configure jdtls for specific needs, can cry here later
    settings = {
      java = {}
    },

    -- same but with initialization options, like debugger
    init_options = {
      bundles = {}
    },
  }

  -- Start or attach already existent client and server
  require('jdtls').start_or_attach(config)
end

return M
