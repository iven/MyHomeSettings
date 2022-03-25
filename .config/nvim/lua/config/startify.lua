vim.g.startify_enable_special = 0
vim.g.startify_files_number = 8
vim.g.startify_change_to_dir = 1
vim.g.startify_update_oldfiles = 1
vim.g.startify_session_autoload = 1
vim.g.startify_session_persistence = 1
vim.g.startify_session_delete_buffers = 1

vim.g.startify_custom_header = {
  [[                      ____',]],
  [[       (o)--(o)      /    \',]],
  [[      /.______.\    <  苟  |',]],
  [[      \________/     \____/',]],
  [[     ./        \.',]],
  [[    ( .        , )',]],
  [[     \ \_\\//_/ /',]],
  [[      ~~  ~~  ~~',]],
}
vim.g.startify_skiplist = { 'COMMIT_EDITMSG' }
vim.g.startify_bookmarks = {
  { c = '~/.config/nvim/lua/plugins.lua' },
  { z = '~/.config/zsh/.zshrc' },
}
vim.g.startify_session_dir = '~/.local/share/nvim/sessions'
vim.g.startify_lists = {
  {
    type = 'sessions',
    header = { '   会话列表：' },
  },
  {
    type = 'dir',
    header = { '   当前目录 [ ' .. vim.fn.getcwd() .. ' ]：' },
  },
  {
    type = 'files',
    header = { '   最常使用：' },
  },
  {
    type = 'bookmarks',
    header = { '   书签列表：' },
  },
  {
    type = 'commands',
    header = { '   命令列表：' },
  },
  -- ['   当前目录 ['.getcwd().']：'], 'dir',
}

vim.g.startify_custom_footer = {'', "   请帮助使用这台电脑的可怜儿童！", ''}

vim.cmd [[autocmd User Startified setlocal cursorline]]
