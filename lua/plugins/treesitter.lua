return {
  -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  build = ':TSUpdate',
  config = function ()
    require('plugins.configs.treesitter')
    local ts_repeat_move = require('nvim-treesitter.textobjects.repeatable_move')

    -- Repeat movement with ; and ,
    -- ensure ; goes forward and , goes backward regardless of the last direction
    vim.keymap.set({ "n", "x", "o" }, ";", function ()
      ts_repeat_move.repeat_last_move()
      vim.cmd("normal! zz")
    end)
    vim.keymap.set({ "n", "x", "o" }, ",", function ()
      ts_repeat_move.repeat_last_move_previous()
      vim.cmd("normal! zz")
    end)
    vim.keymap.set({ "n", "x", "o" }, "f", function ()
      ts_repeat_move.builtin_f()
      vim.cmd("normal! zz")
    end)
    vim.keymap.set({ "n", "x", "o" }, "F", function()
      ts_repeat_move.builtin_F()
      vim.cmd("normal! zz")
    end)
    vim.keymap.set({ "n", "x", "o" }, "t", function()
      ts_repeat_move.builtin_t()
      vim.cmd("normal! zz")
    end)
    vim.keymap.set({ "n", "x", "o" }, "T", function()
      ts_repeat_move.builtin_T()
      vim.cmd("normal! zz")
    end)
  end,
}
