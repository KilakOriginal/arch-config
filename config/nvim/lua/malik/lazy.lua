local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '

local plugins = {

  -- Telescope fuzzy finder
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    -- or                          , branch = '0.1.x',
    dependencies = { {'nvim-lua/plenary.nvim'} }
  },

  -- Colour Schemes
  {
    'EdenEast/nightfox.nvim',
    as = 'carbonfox',
    --config = function()
      --vim.cmd('colorscheme carbonfox')
    --end
  },
  {
    'lunarvim/synthwave84.nvim',
    as = 'synthwave84',
    config = function ()
      vim.cmd('colorscheme synthwave84')
    end
  },

  -- Treesitter syntax highlighting
  'nvim-treesitter/nvim-treesitter', build = ':TSUpdate',
  'nvim-treesitter/playground',

  'theprimeagen/harpoon',

  'mbbill/undotree',

  'tpope/vim-fugitive',

  -- LSP
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate" -- :MasonUpdate updates registry contents
  },

  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Optional
        'williamboman/mason.nvim',
        build = function()
        pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Optional
      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
    }
  },

  {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && yarn install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
  ft = { "markdown" },
  },

  {
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
      -- Configuration here, or leave empty to use defaults
    })
    end
  },

  {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  },

  {
  'glepnir/dashboard-nvim',
  as = 'dashboard',
  event = 'VimEnter',
  dependencies = {'nvim-tree/nvim-web-devicons'}
  },

  'feline-nvim/feline.nvim',

  'mrcjkb/haskell-tools.nvim',

}

require("lazy").setup(plugins, {})

