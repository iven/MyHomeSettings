require('settings')
require('keymaps')

local cmd = vim.cmd
local fn = vim.fn
local opt = vim.opt

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  Packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})

  -- https://github.com/wbthomason/packer.nvim/issues/750
  table.insert(opt.runtimepath, 1, fn.stdpath('data') .. '/site/pack/*/start/*')
end

cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerCompile
  augroup end
]]

require("packer").startup(function(use)
  -- make sure to add this line to let packer manage itself
  use 'wbthomason/packer.nvim'

  -- 基本
  use {
    'lewis6991/impatient.nvim',
    config = function() require('impatient') end,
  }
  -- https://github.com/neovim/neovim/issues/12587
  use {
    'antoinemadec/FixCursorHold.nvim',
    config = function()
      vim.g.cursorhold_updatetime = 100
    end,
  }
  -- TODO: 添加一些格式化工具
  -- use {
  --   'jose-elias-alvarez/null-ls.nvim',
  --   requires = 'nvim-lua/plenary.nvim',
  --   config = function() require('plugins.null-ls') end,
  -- }
  use {
    'mhinz/vim-startify',
    config = function() require('plugins.startify') end,
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons',
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    },
    config = function() require('plugins.telescope') end,
    cmd = 'Telescope',
    module = 'telescope',
  }

  -- 外观
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    requires = {
      'p00f/nvim-ts-rainbow',
      'nvim-treesitter/nvim-treesitter-refactor',
    },
    config = function() require('plugins.nvim-treesitter') end,
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function() require('lualine').setup() end,
  }
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end,
  }
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function() require('plugins.indent_blankline') end,
  }
  use {
    "themercorp/themer.lua",
    config = function() require('plugins.themer') end,
  }
  use {
    "norcalli/nvim-colorizer.lua",
    config = function() require('colorizer').setup() end,
    opt = true,
  }
  use 'ntpeters/vim-better-whitespace'

  -- 语法
  use {
    'neovim/nvim-lspconfig',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'lukas-reineke/lsp-format.nvim',
    },
    config = function() require('plugins.lspconfig') end,
  }
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      { 'tzachar/cmp-tabnine', run = './install.sh' },
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lua',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets',
      'lukas-reineke/cmp-under-comparator',
      'onsails/lspkind-nvim',
    },
    config = function() require('plugins.cmp') end,
  }
  use {
    'folke/trouble.nvim',
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require('trouble').setup {
        auto_close = true,
        auto_jump = { 'lsp_definitions', 'lsp_type_definitions' },
      }
    end,
    cmd = 'Trouble',
    module = 'trouble',
  }
  use {
    'kosayoda/nvim-lightbulb',
    config = function()
      vim.cmd [[autocmd CursorHold,CursorHoldI * lua require('nvim-lightbulb').update_lightbulb()]]
    end,
  }

  -- 编辑
  use {
    'windwp/nvim-autopairs',
    config = function() require('plugins.nvim-autopairs') end,
    event = 'InsertEnter',
  }
  use {
    'phaazon/hop.nvim',
    branch = 'v1',
    config = function() require('hop').setup() end,
    module = 'hop',
  }
  use {
    'RRethy/nvim-treesitter-endwise',
    config = function() require('nvim-treesitter.configs').setup { endwise = { enable = true } } end,
    ft = { 'ruby', 'lua', 'vimscript', 'bash' },
  }
  use {
    'terrortylor/nvim-comment',
    config = function() require('nvim_comment').setup() end,
  }
  use {
    'tpope/vim-rsi',
    event = 'InsertEnter',
  }
  use {
    'tpope/vim-abolish',
    cmd = 'S',
  }
  use 'mg979/vim-visual-multi'

  -- 其他
  use {
    'dinhhuy258/git.nvim',
    config = function() require('git').setup() end,
  }
  use {
    'simnalamburt/vim-mundo',
    config = function()
      vim.g.mundo_right = 1
      vim.g.mundo_close_on_revert = 1
      vim.g.mundo_prefer_python3 = 1
    end,
    cmd = 'MundoToggle',
  }
  use {
    'tpope/vim-eunuch',
    cmd = {
      'SudoEdit', 'SudoWrite', 'Remove', 'Rename', 'Delete', 'Move', 'Unlink',
    }
  }
  use {
    'aserowy/tmux.nvim',
    config = function() require('plugins.tmux') end,
  }
  use {
    'h-hg/fcitx.nvim',
    event = 'InsertEnter',
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if Packer_bootstrap then
    require('packer').sync()
  end
end)
