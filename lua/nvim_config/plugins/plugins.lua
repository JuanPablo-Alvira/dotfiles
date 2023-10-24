-- Download and install lazy.nvim if not already installed
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)

-- Plugins

require('lazy').setup({
    -- VSCODE THEME
    'Mofiqul/vscode.nvim',

    -- LIGHTLINE
    'itchyny/lightline.vim',

    -- TELESCOPE
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
          'nvim-lua/plenary.nvim',
          -- Fuzzy Finder Algorithm which requires local dependencies to be built.
          -- Only load if `make` is available. Make sure you have the system
          -- requirements installed.
          {
            'nvim-telescope/telescope-fzf-native.nvim',
            -- NOTE: If you are having trouble with this installation,
            --       refer to the README for telescope-fzf-native for more instructions.
            build = 'make',
            cond = function()
              return vim.fn.executable 'make' == 1
            end,
          },
        },
      },

      -- TREESITTER
      {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
          'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ':TSUpdate',
      },


      -- AUTOPAIRS
      {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
      },

      -- AUTOTAGS
      'windwp/nvim-ts-autotag',

     --UNDOTREE
      'mbbill/undotree', 

      -- LSP (Language Server Protocol)
      {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},
      {'neovim/nvim-lspconfig'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/nvim-cmp'},
      {'L3MON4D3/LuaSnip'},


      -- NVIM TREE
      {
      "nvim-tree/nvim-tree.lua",
      version = "*",
        lazy = false,
        dependencies = {
          "nvim-tree/nvim-web-devicons",
        },
      },
})