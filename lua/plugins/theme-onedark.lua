return {
  -- Theme inspired by Atom
  'navarasu/onedark.nvim',
  priority = 1000,
  config = function()
    vim.cmd.colorscheme 'onedark'
  end,
}
-- vim: ts=2 sts=2 sw=2 et
