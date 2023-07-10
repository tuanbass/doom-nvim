-- Unintegrated packages
-- Spotify
-- goto-preview
-- NeoRoot
-- ThePrimeagen/refactoring.nvim
-- ray-x/lsp_signature.nvim
-- ray-x/lsp_signature.nvim
-- rcarriga/nvim-dap-ui
-- theHamsta/nvim-dap-virtual-text
-- nvim-telescope/telescope-dap.nvim
-- gcmt/taboo.vim
-- pretty-fold
-- fold-preview
-- preservim/vim-markdown
-- godlygeek/tabular
-- iamcco/markdown-preview.nvim
-- SidOfc/mkdx
-- nvim-orgmode/orgmode
-- ekickx/clipboard-image.nvim
local M = {}

M.settings = {}

M.packages = {
  ["yanky"] = {
    "gbprod/yanky.nvim",
  },
  ["substitute"] = {
    "gbprod/substitute.nvim",
  },
  -- ["vimade"] = {
  --   "TaDaa/vimade",
  -- },
}

M.configs = {
  ["substitute"] = function()
    -- Lua
    require("substitute").setup({
      highlight_substituted_text = {
        enabled = true,
        timer = 1000,
      },
    })
    vim.keymap.set("n", "s", require("substitute").operator, { noremap = true })
    vim.keymap.set("n", "ss", require("substitute").line, { noremap = true })
    vim.keymap.set("n", "S", require("substitute").eol, { noremap = true })
    vim.keymap.set("x", "s", require("substitute").visual, { noremap = true })

    -- range substitute
    vim.keymap.set("n", "<leader>s", require("substitute.range").operator, { noremap = true })
    vim.keymap.set("x", "<leader>s", require("substitute.range").visual, { noremap = true })

    vim.keymap.set("n", "<leader>ss", function()
      -- tricky: pass a empty table to subject to avoid nil exception
      require("substitute.range").word({ subject = { } })
    end, { noremap = true })
  end,
  ["yanky"] = function()
    require("yanky").setup({
      preserve_cursor_position = {
        enabled = true,
      },
    })

    local _ok, telescope = pcall(require, "telescope")
    if _ok then
      telescope.load_extension("yank_history")
    end
  end,
}

M.autocmds = {}

M.cmds = {}
M.binds = {
  -- show yank history
  {
    "gy",
    [[<cmd>Telescope yank_history<CR>]],
    name = "Yank history",
    mode = "nv",
  },
  -- overwrite default yank register
  {
    "y",
    [[<Plug>(YankyYank)]],
    name = "Yank",
    mode = "nx",
  },
}

-- Notes:
-- code for load module located at doom.core.module.load_modules
-- code for binding: ddom.services.keymaps.applyKeymaps
return M
