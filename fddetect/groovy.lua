vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = { '*.Jenkinsfile' },
  callback = function()
    vim.opt_local.filetype = 'groovy'
  end,
})
