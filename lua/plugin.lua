return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- nvim-tree
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- tokyonight
  use 'folke/tokyonight.nvim'

  -- bufferline
  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}

  -- lspconfig
  use {
    "williamboman/nvim-lsp-installer",
    "neovim/nvim-lspconfig",
  }
  -- mason.nvim
  use { 
    "williamboman/mason.nvim", 
    "williamboman/mason-lspconfig.nvim",
  }

  -- treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      require('nvim-treesitter.install').update({ with_sync = true })
    end,
  }

   -- nvim-cmp
  use 'hrsh7th/cmp-nvim-lsp' -- { name = nvim_lsp }
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-buffer'   -- { name = 'buffer' },
  use 'hrsh7th/cmp-path'     -- { name = 'path' }
  use 'hrsh7th/cmp-cmdline'  -- { name = 'cmdline' }
  use 'hrsh7th/nvim-cmp'

  -- vsnip
  use 'hrsh7th/cmp-vsnip'    -- { name = 'vsnip' }
  use 'hrsh7th/vim-vsnip'
  use 'rafamadriz/friendly-snippets'

  -- LuaSnip
  use { 'L3MON4D3/LuaSnip' }
  use { 'saadparwaiz1/cmp_luasnip' }

  -- lspkind
  use 'onsails/lspkind-nvim'
  vim.opt.completeopt = { "menu", "menuone", "noselect" }

  -- lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- scroll bar
  use("petertriho/nvim-scrollbar")

  -- hlslens
  use {'kevinhwang91/nvim-hlslens'}

  -- Comment
  use {
    'numToStr/Comment.nvim',
  }

  -- undotree
  use { 'mbbill/undotree' }

  --visita
  use 'liuchengxu/vista.vim'

  --vim-translator
  use 'voldikss/vim-translator'

  --minimap
  use 'wfxr/minimap.vim'

  --satellite
  use {
    'lewis6991/satellite.nvim',
  }
  use 'dstein64/nvim-scrollview'

  -- gruvbox
  use {
    "ellisonleao/gruvbox.nvim",
    requires = {"rktjmp/lush.nvim"}
  }

  --vim-lastplace
  use 'farmergreg/vim-lastplace'

  --markdown-preview
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  -- vim-surround
  use 'tpope/vim-surround'

  -- fzf.vim
  use { 
    'junegunn/fzf',
    'junegunn/fzf.vim'
  }

  -- nlsp-settings
  use 'tamago324/nlsp-settings.nvim'

  -- lsp-format
  use "lukas-reineke/lsp-format.nvim"

  -- easy-align
  use 'junegunn/vim-easy-align'

  -- blankline
  use "lukas-reineke/indent-blankline.nvim"

  --lspsaga
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
  })
end)
