require("bufferline").setup {
  options = {
    mode = "tabs",
    separator_style = "slant",
    truncate_names = false,
    diagnostics = "nvim_lsp",
    always_show_bufferline = false,
    show_close_icon = false,
    hover = {
      enabled = true,
      delay = 0,
      reveal = { 'close' },
    },
  },
}
