-- Module to enable mail client in vim
-- using himalaya mail client
local M = {}

M.settings = {
}

M.packages = {
  ["himalaya.vim"] = {
    -- "/soywod/himalaya.vim",
    "https://git.sr.ht/~soywod/himalaya-vim",
  },
}

M.configs = {
  -- ["zen-mode.nvim"] = function()
  --       require("zen-mode").setup {
  --         window = {
  --           width = 180,
  --         }
  --       }
  -- end,

}

M.autocmds = {
}

M.cmds = {
}
-- M.requires_modules = { "features.auto_install" }
-- M.binds kk
-- {
--   -- {
--   --   "ghw",
--   --   [[<cmd>HopWord<CR>]],
--   --   name = "Go to word in the screen",
--   --   mode = "nv",
--   -- },
-- }

-- Notes:
-- code for load module located at doom.core.module.load_modules
-- code for binding: ddom.services.keymaps.applyKeymaps
return M
