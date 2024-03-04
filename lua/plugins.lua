-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
return {
  -- NOTE: First, some plugins that don't require any configuration
  {'MTDL9/vim-log-highlighting',
    lazy = true,
  },

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',


  -- Setup neovim lua configuration
  { 'folke/neodev.nvim',
    opts = {},
    config = function ()
      require('neodev').setup()
    end
  },

  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  -- { -- LSP Configuration & Plugins
  --   'neovim/nvim-lspconfig',
  --   dependencies = {
  --     -- Automatically install LSPs to stdpath for neovim
  --     { 'williamboman/mason.nvim', config = true },
  --     'williamboman/mason-lspconfig.nvim',
  --
  --     -- Useful status updates for LSP
  --     -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
  --     { 'j-hui/fidget.nvim', opts = {} },
  --
  --     -- Additional lua configuration, makes nvim stuff amazing!
  --     'folke/neodev.nvim',
  --   },
  -- },

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim',
    opts = {},
    config = function ()
      require('plugins.configs.which-key')
    end,
    enabled = true,
  },

  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        theme = 'onedark',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {},
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  {
    -- Auto pairs and closes brackets
    'm4xshen/autoclose.nvim', opts = {}
  },

  { -- Getting you where you want
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function ()
      require('plugins.configs.harpoon')
    end
  },

  -- NOTE: Next Step on Your Neovim Journey: Add/Configure additional "plugins" for kickstart
  --       These are some example plugins that I've included in the kickstart repository.
  --       Uncomment any of the lines below to enable them.
  -- require 'kickstart.plugins.autoformat',
  -- require 'kickstart.plugins.debug',

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    You can use this folder to prevent any conflicts with this init.lua if you're interested in keeping
  --    up-to-date with whatever is in the kickstart repo.
  --    Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  --
  --    For additional information see: https://github.com/folke/lazy.nvim#-structuring-your-plugins
  -- { import = 'custom.plugins' },
}
