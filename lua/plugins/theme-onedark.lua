return {
  -- Theme inspired by Atom
  'navarasu/onedark.nvim',
  config = function()
    require('onedark').setup {
      style = 'dark', -- Options: 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'
      toggle_style_list = {'dark', 'light'}, -- List of styles to toggle between
    }
    vim.cmd.colorscheme 'onedark'
    vim.keymap.set('n', '<leader>ts', require('onedark').toggle, { desc = '[T]oggle [S]tyle' })
  end,
}
-- vim: ts=2 sts=2 sw=2 et
