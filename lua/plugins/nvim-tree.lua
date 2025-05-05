return {
  'nvim-tree/nvim-tree.lua',
  enabled = true,
  version = "*",
  lazy = false,
  dependencies = {
    -- 'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  config = function ()
    require('nvim-tree').setup {}
    vim.keymap.set('n', '<C-n>', '<cmd> NvimTreeToggle <CR>', { desc = 'Toggle filetree' })
  end,
}
