local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup {
  defaults = {
    mappings = {
      i = {
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        ['<C-d>'] = false,
        ['<C-u>'] = false,
        ['<esc>'] = actions.close,
      },
    },
    sorting_strategy = 'ascending',
    layout_strategy = 'center',
  },
}
telescope.load_extension('fzf')
