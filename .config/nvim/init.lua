require('settings')
require('keymaps')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup({
  -- https://github.com/neovim/neovim/issues/12587
  {
    'antoinemadec/FixCursorHold.nvim',
    config = function()
      vim.g.cursorhold_updatetime = 100
    end,
  },
  {
    'mhinz/vim-startify',
    config = function() require('plugins.startify') end,
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'nvim-telescope/telescope-ui-select.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function() require('plugins.telescope') end,
    keys = {
      { '<C-p>', function() require('telescope.builtin').git_files() end },
      { '<leader>f', function() require('telescope.builtin').find_files() end },
      {
        '<leader>a',
        function()
          local git_root, _ = require('telescope.utils').get_os_command_output({ "git", "rev-parse", "--show-toplevel" })
          require('telescope.builtin').live_grep { cwd = git_root[1] }
        end,
      },
    },
  },
  {
    'debugloop/telescope-undo.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require('telescope').load_extension('undo')
    end,
    keys = {
      { "<leader>u", "<cmd>Telescope undo<cr>" },
    },
  },
  -- 外观
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function() require('plugins.nvim-treesitter') end,
  },
  {
    'mrjones2014/nvim-ts-rainbow',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
  },
  {
    'akinsho/bufferline.nvim',
    version = "^3.1.0",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('plugins.bufferline')
    end,
    keys = {
      { "<C-t>", "<cmd>BufferLinePick<cr>" },
      { "<leader>1", "<cmd>BufferLineGoToBuffer 1<cr>" },
      { "<leader>2", "<cmd>BufferLineGoToBuffer 2<cr>" },
      { "<leader>3", "<cmd>BufferLineGoToBuffer 3<cr>" },
      { "<leader>4", "<cmd>BufferLineGoToBuffer 4<cr>" },
      { "<leader>5", "<cmd>BufferLineGoToBuffer 5<cr>" },
      { "<leader>6", "<cmd>BufferLineGoToBuffer 6<cr>" },
      { "<leader>7", "<cmd>BufferLineGoToBuffer 7<cr>" },
      { "<leader>8", "<cmd>BufferLineGoToBuffer 8<cr>" },
      { "<leader>9", "<cmd>BufferLineGoToBuffer 9<cr>" },
      { "<leader>$", "<cmd>BufferLineGoToBuffer -1<cr>" },
    },
    lazy = false,
  },
  {
    "utilyre/barbecue.nvim",
    version = "*",
    dependencies = {
      "neovim/nvim-lspconfig",
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("barbecue").setup {
        attach_navic = false,
        show_modified = true,
      }
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      { 'nvim-tree/nvim-web-devicons' },
    },
    config = function()
      require('lualine').setup {
        inactive_sections = {
          lualine_c = {
            {
              'filename',
              path = 2,
            },
          },
        },
      }
    end,
  },
  {
    'lewis6991/gitsigns.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
    config = function() require('gitsigns').setup() end,
  },
  {
    "petertriho/nvim-scrollbar",
    config = function()
      require("scrollbar").setup()
      require("scrollbar.handlers.gitsigns").setup()
    end
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function() require('plugins.indent_blankline') end,
  },
  {
    "themercorp/themer.lua",
    config = function() require('plugins.themer') end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    config = function() require('colorizer').setup({}) end,
    ft = { 'vim', 'lua', 'css' },
  },
  {
    "j-hui/fidget.nvim",
    config = function()
      require('fidget').setup {
        text = {
          spinner = "meter",
        },
      }
    end,
  },
  {
    'prichrd/netrw.nvim',
    config = function() require 'netrw'.setup({}) end,
    ft = 'netrw',
  },
  {
    'johnfrankmorgan/whitespace.nvim',
    config = function()
      require('whitespace-nvim').setup({
        highlight = 'DiffDelete',
        ignored_filetypes = { 'TelescopePrompt', 'Trouble', 'toggleterm', 'lazy', 'lspinfo', 'help' },
      })
    end
  },
  'xiyaowong/virtcolumn.nvim',
  -- 语法
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- 启用基于 LSP 的自动补全
      'hrsh7th/cmp-nvim-lsp',
      -- 保存时自动格式化文件
      'lukas-reineke/lsp-format.nvim',
      -- 将 Linter 等伪装成 LSP Server
      'jose-elias-alvarez/null-ls.nvim',
      -- 高亮光标下的变量及其定义和使用
      'RRethy/vim-illuminate',
      -- 实时显示函数参数定义
      'ray-x/lsp_signature.nvim',
      {
        'lvimuser/lsp-inlayhints.nvim',
        commit = '9bcd6fe25417b7808fe039ab63d4224f2071d24a',
      },
    },
    config = function() require('plugins.lspconfig') end,
    keys = {
      { 'K', function() vim.lsp.buf.hover() end },
      { 'gd', function() vim.lsp.buf.definition() end },
      { 'gD', function() vim.lsp.buf.type_definition() end },

      { '<leader>ca', function() vim.lsp.buf.code_action() end },
      { '<leader>F', function() vim.lsp.buf.formatting() end },
      { '<leader>R', function() vim.lsp.buf.rename() end },

      { '[d', function() vim.diagnostic.goto_prev() end },
      { ']d', function() vim.diagnostic.goto_next() end },

      { 'gwa', function() vim.lsp.buf.add_workspace_folder() end },
      { 'gwr', function() vim.lsp.buf.remove_workspace_folder() end },
      { 'gwl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end },
    },
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lua',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets',
      'lukas-reineke/cmp-under-comparator',
      -- 在补全菜单显示类似 VSCode 的图标
      'onsails/lspkind-nvim',
    },
    config = function() require('plugins.cmp') end,
    event = 'InsertEnter',
  },
  {
    "jcdickinson/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup({})
    end
  },
  {
    'folke/trouble.nvim',
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      'neovim/nvim-lspconfig',
    },
    config = function()
      require('trouble').setup {
        auto_close = true,
        auto_jump = { 'lsp_definitions', 'lsp_type_definitions' },
      }
    end,
    keys = {
      { '<leader>d', function() require('trouble').toggle({ mode = 'document_diagnostics' }) end },
      { '<leader>D', function() require('trouble').toggle({ mode = 'workspace_diagnostics' }) end },
      { 'gr', function() require('trouble').toggle({ mode = 'lsp_references' }) end },
      { 'gi', function() require('trouble').toggle({ mode = 'lsp_implementations' }) end },
    },
    cmd = 'Trouble',
  },
  'kosayoda/nvim-lightbulb',
  -- 编辑
  {
    'windwp/nvim-autopairs',
    config = function() require('plugins.nvim-autopairs') end,
    event = 'InsertEnter',
  },
  {
    'phaazon/hop.nvim',
    branch = 'v2',
    config = function() require('hop').setup() end,
    lazy = true,
    keys = {
      {
        'f',
        function()
          require('hop').hint_char1({
            direction = require 'hop.hint'.HintDirection.AFTER_CURSOR,
            current_line_only = true,
          })
        end,
        mode = { 'n', 'o' },
      },
      {
        'F',
        function()
          require('hop').hint_char1({
            direction = require 'hop.hint'.HintDirection.BEFORE_CURSOR,
            current_line_only = true,
          })
        end,
        mode = { 'n', 'o' },
      },
      { '<leader><leader>c', function() require('hop').hint_char1() end },
      { '<leader><leader>w', function() require('hop').hint_words() end },
    },
  },
  {
    'RRethy/nvim-treesitter-endwise',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    config = function() require('nvim-treesitter.configs').setup { endwise = { enable = true } } end,
    ft = { 'ruby', 'lua', 'vimscript', 'bash' },
  },
  {
    'terrortylor/nvim-comment',
    config = function() require('nvim_comment').setup() end,
  },
  {
    'Wansmer/treesj',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('treesj').setup {
        use_default_keymaps = false,
        max_join_length = 1024,
      }
    end,
    keys = {
      { '<leader>jm', function() require('treesj').toggle() end },
      { '<leader>js', function() require('treesj').split() end },
      { '<leader>jj', function() require('treesj').join() end },
    },
  },
  {
    'linty-org/readline.nvim',
    keys = {
      { '<M-f>', function() require('readline').forward_word() end, mode = '!' },
      { '<M-b>', function() require('readline').backward_word() end, mode = '!' },
      { '<C-a>', function() require('readline').beginning_of_line() end, mode = '!' },
      { '<C-e>', function() require('readline').end_of_line() end, mode = '!' },
      { '<M-d>', function() require('readline').kill_word() end, mode = '!' },
      { '<C-w>', function() require('readline').backward_kill_word() end, mode = '!' },
      { '<C-k>', function() require('readline').kill_line() end, mode = '!' },
      { '<C-u>', function() require('readline').backward_kill_line() end, mode = '!' },
      { '<C-f>', '<Right>', mode = '!' },
      { '<C-b>', '<Left>', mode = '!' },
      { '<C-n>', '<Down>', mode = '!' },
      { '<C-p>', '<Up>', mode = '!' },
      { '<C-d>', '<Delete>', mode = '!' },
      { '<C-h>', '<BS>', mode = '!' },
    },
  },
  {
    'tpope/vim-abolish',
    cmd = 'S',
  },
  {
    'gpanders/editorconfig.nvim',
  },
  'mg979/vim-visual-multi',
  -- 其他
  {
    'dinhhuy258/git.nvim',
    config = function() require('git').setup() end,
  },
  {
    'tpope/vim-eunuch',
    cmd = {
      'SudoEdit', 'SudoWrite', 'Remove', 'Rename', 'Delete', 'Move', 'Unlink',
    },
  },
  {
    'ojroques/nvim-osc52',
    config = function()
      require('osc52').setup {
        max_length = 1000000,
      }
      -- 不知道为啥，用 Lazy 的写法不好使
      vim.keymap.set('n', '<leader>c', require('osc52').copy_operator, { expr = true })
      vim.keymap.set('n', '<leader>cc', '<leader>c_', { remap = true })
      vim.keymap.set('x', '<leader>c', require('osc52').copy_visual)
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    version = '*',
    config = function()
      require('toggleterm').setup {
        open_mapping = "<c-`>",
        direction = 'float',
        shell = 'fish',
        winbar = {
          enabled = true,
        },
      }
    end,
  },
  {
    'aserowy/tmux.nvim',
    config = function() require('plugins.tmux') end,
    enabled = false,
  },
  {
    'knubie/vim-kitty-navigator',
    build = 'cp ./*.py ~/.config/kitty/',
  },
  {
    'h-hg/fcitx.nvim',
    event = 'InsertEnter',
  }
})
