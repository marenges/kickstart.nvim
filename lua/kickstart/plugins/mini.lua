return {
  -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
  config = function()
    -- Better Around/Inside textobjects
    require('mini.ai').setup { n_lines = 500 }

    -- Fill open/closing brackets/quotes
    require('mini.pairs').setup()

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    require('mini.surround').setup()

    -- Simple and easy statusline.
    local statusline = require 'mini.statusline'
    -- set use_icons to true if you have a Nerd Font
    statusline.setup { use_icons = vim.g.have_nerd_font }

    -- You can configure sections in the statusline by overriding their
    -- default behavior. For example, here we set the section for
    -- cursor location to LINE:COLUMN
    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return '%2l:%-2v'
    end

    -- File tree.
    local files = require 'mini.files'
    files.setup()
    local minifiles_toggle = function()
      if not files.close() then
        files.open(vim.api.nvim_buf_get_name(0))
      end
    end
    vim.keymap.set('n', '\\', function ()
      if vim.api.nvim_buf_get_name(0):match('^ministarter:') then
        starter.close()
        files.open(vim.fn.getcwd())
      else
        minifiles_toggle()
      end
    end, { desc = 'Toggle filetree' })

    -- Session management
    require('mini.sessions').setup()

    -- Welcome screen
    local starter = require 'mini.starter'
    local builtin = require 'telescope.builtin'
    starter.setup {
      items = {
        starter.sections.builtin_actions(),
        starter.sections.recent_files(7, true),
        starter.sections.recent_files(7, false),
        { name = 'Find file', action = builtin.find_files, section = 'Telescope' },
        -- After setting up 'mini.session', you can use:
        starter.sections.sessions(5, true),
      },
      header = table.concat({ 'Welcome to Nvim!' }, '\n'),
    }
    -- ... and there is more!
    --  Check out: https://github.com/echasnovski/mini.nvim
  end,
}
-- vim: ts=2 sts=2 sw=2 et
