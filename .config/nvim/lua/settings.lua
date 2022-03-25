-----------------------------------------------------------
-- General Neovim settings and configuration
-----------------------------------------------------------

-- Default options are not included
--- See: https://neovim.io/doc/user/vim_diff.html
--- [2] Defaults - *nvim-defaults*

-----------------------------------------------------------
-- Neovim API aliases
-----------------------------------------------------------
local cmd = vim.cmd                   -- Execute Vim commands
local exec = vim.api.nvim_exec        -- Execute Vimscript
local g = vim.g                       -- Global variables
local opt = vim.opt                   -- Set options (global/buffer/windows-scoped)
-- local fn = vim.fn                     -- Call Vim functions

-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.fileencodings = 'ucs-bom,utf-8,gb18030,gb2312,gbk,cp936'
opt.mouse = 'a'                       -- Enable mouse support
opt.clipboard = 'unnamedplus'         -- 使用系统剪贴板，需要安装 xclip 或者 wl-clipboard
opt.swapfile = false                  -- Don't use swapfile
opt.undofile = true                   -- 保存 Undo 历史
opt.autochdir = true                  -- 随编辑文件自动跳转目录
opt.whichwrap = 'b,s,<,>,h,l'         -- 设置跨行键
opt.shell = '/bin/bash'               -- 设置终端

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.number = true                     -- Show line number
opt.showmatch = true                  -- Highlight matching parenthesis
opt.foldmethod = 'expr'               -- Enable folding (default 'foldmarker')
opt.foldexpr = 'nvim_treesitter#foldexpr()'
opt.foldlevelstart = 99               -- Disable folding by default
opt.colorcolumn = '80'                -- Line lenght marker at 80 columns
opt.ignorecase = true                 -- Ignore case letters when search
opt.smartcase = true                  -- Ignore lowercase for the whole pattern
opt.linebreak = true                  -- Wrap on word boundary
opt.cursorline = true                 -- 高亮当前行
opt.termguicolors = true              -- Enable 24-bit RGB colors
opt.inccommand = 'split'              -- 即时显示替换结果
opt.conceallevel = 0                  -- 禁止 JSON, Markdown 等文件隐藏特定语法相关字符的行为
opt.list = true
opt.listchars:append('tab:>-,eol:¬,trail:·,extends:↷,precedes:↶')

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true                  -- Use spaces instead of tabs
opt.shiftwidth = 4                    -- Shift 4 spaces when tab
opt.tabstop = 4                       -- 1 tab == 4 spaces
opt.smartindent = true                -- Autoindent new lines

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true                     -- Enable background buffers
opt.lazyredraw = true                 -- Faster scrolling
opt.synmaxcol = 240                   -- Max column for syntax highlight
-- opt.updatetime = 400                  -- ms to wait for trigger 'document_highlight'

-----------------------------------------------------------
-- Startup
-----------------------------------------------------------

-- Disable nvim intro
opt.shortmess:append "sI"

-- Disable builtins plugins
local disabled_built_ins = {
    -- "netrw",
    -- "netrwPlugin",
    -- "netrwSettings",
    -- "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
    g["loaded_" .. plugin] = 1
end

-----------------------------------------------------------
-- Autocommands
-----------------------------------------------------------

-- Remove whitespace on save
-- cmd [[au BufWritePre * :%s/\s\+$//e]]

-- Highlight on yank
exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=800}
  augroup end
]], false)

-- Don't auto commenting new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- Remove colorcolumn for selected filetypes
cmd [[autocmd FileType text,markdown,html,xhtml,javascript setlocal cc=0]]

-- 2 spaces for selected filetypes
cmd [[
  autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml setlocal shiftwidth=2 tabstop=2
]]

-- 跳转到上次编辑位置
cmd [[
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
]]

-- 误触 q: 时，可以用 Esc 键退出
cmd [[
  autocmd CmdwinEnter * nnoremap <buffer> <esc> <cmd>q<cr>
]]
