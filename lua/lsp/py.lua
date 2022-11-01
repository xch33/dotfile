return {
  settings = {
    jedi = {
      workspace = {
        environmentPath = '/usr/bin/python3',
      }
    },
  },
  root_dir = require("lspconfig/util").root_pattern(".git"),
  init_options = {
    workspace = {
      extraPaths = {"/usr/local/lib/python3.8/dist-packages/"}
    }
  }
}
