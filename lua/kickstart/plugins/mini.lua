return {
  -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 500 }

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require('mini.surround').setup()

    -- Simple and easy statusline.
    --  You could remove this setup call if you don't like it,
    --  and try some other statusline plugin
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
    vim.keymap.set('n', '\\', minifiles_toggle, { desc = 'Toggle filetree' })

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
