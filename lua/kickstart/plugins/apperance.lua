return {
  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('tokyonight').setup {
        styles = {
          comments = { italic = true }, -- Disable italics in comments
        },
      }

      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      vim.cmd.colorscheme 'tokyonight-night'
    end,
  },

  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
  -- Theme inspired by Atom
  {
    'navarasu/onedark.nvim',
    config = function()
      require('onedark').setup {
        style = 'dark', -- Options: 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'
        toggle_style_list = { 'dark', 'light' }, -- List of styles to toggle between
      }
      -- vim.cmd.colorscheme 'onedark'
      -- vim.keymap.set('n', '<leader>ts', require('onedark').toggle, { desc = '[T]oggle [S]tyle' })
    end,
  },
  -- Highlight todo, notes, etc in comments
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },

  {
    'MTDL9/vim-log-highlighting',
    lazy = true,
  },
}
