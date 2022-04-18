-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Change leader to a comma
vim.g.mapleader = ','

-- 回车选择当前单词
vim.keymap.set('n', '<cr>', 'viw')

-- Clear search highlighting with <leader> and c
vim.keymap.set('n', '<leader><space>', '<cmd>nohl<cr>')

-- Don't use arrow keys
vim.keymap.set('', '<up>', '<nop>')
vim.keymap.set('', '<down>', '<nop>')
vim.keymap.set('', '<left>', '<nop>')
vim.keymap.set('', '<right>', '<nop>')

-- 折行算作一行
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

-- 分号当作冒号
vim.keymap.set('n', ';', ':')

-- Fast saving with <leader> and w
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>')
vim.keymap.set('n', '<leader>W', '<cmd>SudoWrite<cr>')

-- Move around splits using Ctrl + {h,j,k,l}
-- tmux.nvim 已经提供此功能
-- vim.keymap.set('n', '<C-h>', '<C-w>h')
-- vim.keymap.set('n', '<C-j>', '<C-w>j')
-- vim.keymap.set('n', '<C-k>', '<C-w>k')
-- vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Close all windows and exit from Neovim
vim.keymap.set('n', '<leader>q', '<cmd>qa!<cr>')

-- 快速编辑和重载 init.lua
vim.keymap.set('n', '<leader>s', '<cmd>runtime init.lua<cr>')
vim.keymap.set('n', '<leader>e', '<cmd>e ~/.config/nvim/init.lua<cr>')

-- 防止误触
vim.keymap.set('n', 'q:', '<esc>')
vim.keymap.set({ 'n', 'i' }, '<F1>', '<esc>')

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- Hop
vim.keymap.set({ 'n', 'o' }, 'f', function()
  require('hop').hint_char1({
    direction = require 'hop.hint'.HintDirection.AFTER_CURSOR,
    current_line_only = true,
  })
end)
vim.keymap.set({ 'n', 'o' }, 'F', function()
  require('hop').hint_char1({
    direction = require 'hop.hint'.HintDirection.BEFORE_CURSOR,
    current_line_only = true,
  })
end)
vim.keymap.set('n', '<leader><leader>c', function() require('hop').hint_char1() end)
vim.keymap.set('n', '<leader><leader>w', function() require('hop').hint_words() end)

-- Language Server
vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end)
vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end)
vim.keymap.set('n', 'gD', function() vim.lsp.buf.type_definition() end)
vim.keymap.set('n', 'gr', function() require('trouble').toggle({ mode = 'lsp_references' }) end)
vim.keymap.set('n', 'gi', function() require('trouble').toggle({ mode = 'lsp_implementations' }) end)

vim.keymap.set('n', '<leader>ca', function() require('telescope.builtin').lsp_code_actions() end)
vim.keymap.set('n', '<leader>F', function() vim.lsp.buf.formatting() end)
vim.keymap.set('n', '<leader>R', function() vim.lsp.buf.rename() end)

vim.keymap.set('n', '<leader>d', function() require('trouble').toggle({ mode = 'document_diagnostics' }) end)
vim.keymap.set('n', '<leader>D', function() require('trouble').toggle({ mode = 'workspace_diagnostics' }) end)
vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev() end)
vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next() end)

vim.keymap.set('n', 'gwa', function() vim.lsp.buf.add_workspace_folder() end)
vim.keymap.set('n', 'gwr', function() vim.lsp.buf.remove_workspace_folder() end)
vim.keymap.set('n', 'gwl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end)

-- Telescope
vim.keymap.set('n', '<C-p>', function() require('telescope.builtin').git_files() end)
vim.keymap.set('n', '<leader>f', function() require('telescope.builtin').find_files() end)
vim.keymap.set('n', '<leader>a', function() require('telescope.builtin').live_grep() end)
vim.keymap.set('n', '<leader>t', function() require('telescope.builtin').lsp_document_symbols() end)

-- Mundo
vim.keymap.set('n', '<leader>u', '<cmd>MundoToggle<cr>')
