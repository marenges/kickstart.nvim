local M = {}

M.options = {
  nvchad_branch = "v2.0",
}

M.ui = {
  ------------------------------- base46 -------------------------------------
  -- hl = highlights
  hl_add = {},
  hl_override = {},
  changed_themes = {},
  theme_toggle = { "onedark", "one_light" },
  theme = "onedark", -- default theme
  transparency = false,
  lsp_semantic_tokens = false, -- needs nvim v0.9, just adds highlight groups for lsp semantic tokens

  -- https://github.com/NvChad/base46/tree/v2.0/lua/base46/extended_integrations
  extended_integrations = {}, -- these aren't compiled by default, ex: "alpha", "notify"
  ------------------------------- nvchad_ui modules -----------------------------

  -- lazyload it when there are 1+ buffers
  tabufline = {
    show_numbers = false,
    enabled = true,
    lazyload = true,
  },

  cheatsheet = { theme = "grid" }, -- simple/grid
  --
  -- lsp = {
  --   -- show function signatures i.e args as you type
  --   signature = {
  --     disabled = false,
  --     silent = true, -- silences 'no signature help available' message from appearing
  --   },
  -- },
}

M.plugins = "" -- path i.e "custom.plugins", so make custom/plugins.lua file

M.mappings = require "core.mappings"

return M
