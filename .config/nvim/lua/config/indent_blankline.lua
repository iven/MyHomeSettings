require("indent_blankline").setup {
  show_end_of_line = true,
  show_current_context = true,
  show_first_indent_level = false,
  filetype_exclude = {
    'help',
    'git',
    'markdown',
    'text',
    'terminal',
    'lspinfo',
    'packer',
    'startify',
  },
  buftype_exclude = {
    'terminal',
    'nofile',
  },
}
