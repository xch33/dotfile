require('satellite').setup{
  current_only = true,
  winblend = 100,
  zindex = 40,
  excluded_filetypes = {'nvim-tree'},
  width = 2,
  handlers = {
    search = {
      enable = true,
    },
    diagnostic = {
      enable = true,
    },
    gitsigns = {
      enable = true,
    },
    marks = {
      enable = true,
      show_builtins = false, -- shows the builtin marks like [ ] < >
    },
  },
}
