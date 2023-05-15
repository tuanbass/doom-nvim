local M = {}

M.settings = {}

M.packages = {

  ["ChatGPT"] = {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
}

M.configs = {
  ["ChatGPT"] = function()
    require("chatgpt").setup({
      -- read OpenAPI key from pass file
      api_key_cmd = "pass show chatgpt",
    })
  end,

  -- ["copilot-cmp"] = function()
  --   require("copilot_cmp").setup()
  -- end,
}
M.autocmds = {}

M.cmds = {}
-- M.requires_modules = { "features.auto_install" }
-- M.binds = {
--   {
--     "<leader>go",
--     [[<cmd>Octo actions<CR>]],
--     name = "Octo menu",
--     mode = "nv",
--   },
-- }

-- Notes:
-- code for load module located at doom.core.module.load_modules
-- code for binding: ddom.services.keymaps.applyKeymaps

return M
