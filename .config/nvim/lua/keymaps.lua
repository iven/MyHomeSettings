-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Change leader to a comma
vim.g.mapleader = ','

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Clear search highlighting with <leader> and c
map('n', '<leader><space>', '<cmd>nohl<cr>')

-- Don't use arrow keys
map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

-- 折行算作一行
map('n', 'j', 'gj')
map('n', 'k', 'gk')

-- 分号当作冒号
map('n', ';', ':')

-- Fast saving with <leader> and w
map('n', '<leader>w', '<cmd>w<cr>')
map('n', '<leader>W', '<cmd>SudoWrite<cr>')

-- Move around splits using Ctrl + {h,j,k,l}
-- tmux.nvim 已经提供此功能
-- map('n', '<C-h>', '<C-w>h')
-- map('n', '<C-j>', '<C-w>j')
-- map('n', '<C-k>', '<C-w>k')
-- map('n', '<C-l>', '<C-w>l')

-- Close all windows and exit from Neovim
map('n', '<leader>q', '<cmd>qa!<cr>')

-- 快速编辑和重载 init.lua
map('n', '<leader>s', '<cmd>runtime init.lua<cr>')
map('n', '<leader>e', '<cmd>e ~/.config/nvim/init.lua<cr>')

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- Hop
map('n', 'f', "<cmd>lua require('hop').hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>")
map('n', 'F', "<cmd>lua require('hop').hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>")
map('o', 'f', "<cmd>lua require('hop').hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>")
map('o', 'F', "<cmd>lua require('hop').hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>")
map('n', '<leader><leader>c', "<cmd>lua require('hop').hint_char2()<cr>")
map('n', '<leader><leader>w', "<cmd>lua require('hop').hint_words()<cr>")

-- Language Server
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
map('n', 'gd', "<cmd>lua require('trouble').toggle({ mode = 'lsp_definitions' })<cr>")
map('n', 'gD', "<cmd>lua require('trouble').toggle({ mode = 'lsp_type_definitions' })<cr>")
map('n', 'gr', "<cmd>lua require('trouble').toggle({ mode = 'lsp_references' })<cr>")
map('n', 'gi', "<cmd>lua require('trouble').toggle({ mode = 'lsp_implementations' })<cr>")

map('n', '<leader>ca', "<cmd>lua require('telescope.builtin').lsp_code_actions()<cr>")
map('n', '<leader>F', '<cmd>lua vim.lsp.buf.formatting()<cr>')
map('n', '<leader>R', '<cmd>lua vim.lsp.buf.rename()<cr>')

map('n', '<leader>d', "<cmd>lua require('trouble').toggle({ mode = 'document_diagnostics' })<cr>")
map('n', '<leader>D', "<cmd>lua require('trouble').toggle({ mode = 'workspace_diagnostics' })<cr>")
map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')

map('n', 'gwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>')
map('n', 'gwr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>')
map('n', 'gwl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>')

-- Telescope
map('n', '<C-p>', "<cmd>lua require('telescope.builtin').git_files()<cr>")
map('n', '<leader>f', "<cmd>lua require('telescope.builtin').find_files()<cr>")
map('n', '<leader>a', "<cmd>lua require('telescope.builtin').live_grep()<cr>")
map('n', '<leader>t', "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>")

-- Mundo
map('n', '<leader>u', '<cmd>MundoToggle<cr>')
