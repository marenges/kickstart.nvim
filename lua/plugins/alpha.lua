return {
  'goolord/alpha-nvim',
  event = 'VimEnter',
  config = function()
    local alpha = require('alpha')
    local dashboard = require('alpha.themes.dashboard')

    dashboard.section.buttons.val = {
      dashboard.button('e', '  New file', ':enew<CR>'),
      dashboard.button('f', '  Find file', ':Telescope find_files<CR>'),
      dashboard.button('h', '  Recently opened files', ':Telescope oldfiles<CR>'),
      dashboard.button('b', '  Find buffer', ':Telescope buffers<CR>'),
      dashboard.button('q', '  Quit', ':qa<CR>'),
    }

    alpha.setup(dashboard.opts)
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
