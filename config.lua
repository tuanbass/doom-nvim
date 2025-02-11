-- doom_config - Doom Nvim user configurations file
--
-- This file contains the user-defined configurations for Doom nvim.
-- Just override stuff in the `doom` global table (it's injected into scope
-- automatically).


-- ADDING A PACKAGE
-- doom.use_package("EdenEast/nightfox.nvim", "sainnhe/sonokai") doom.use_package({
--   "ur4ltz/surround.nvim",
--   config = function()
--     require("surround").setup({mappings_style = "sandwich"})
--   end
-- })

-- ADDING A KEYBIND doom.use_keybind({
--   -- The `name` field will add the keybind to whichkey
--   {"<leader>s", name = '+search', {
--     -- Bind to a vim command
--     {"g", "Telescope grep_string<CR>", name = "Grep project"},
--     -- Or to a lua function
--     {"p", function()
--       print("Not implemented yet")
--     end, name = ""}
--   }}
-- })

-- ADDING A COMMAND
--
-- doom.use_cmd({
--   {"CustomCommand1", function() print("Trigger my custom command 1") end},
--   {"CustomCommand2", function() print("Trigger my custom command 2") end}
-- })

-- ADDING AN AUTOCOMMAND
--
-- doom.use_autocmd({
--   { "FileType", "javascript", function() print('This is a javascript file') end }
-- })

-- doom.indent = 2
-- doom.core.treesitter.settings.show_compiler_warning_message = false
doom.ignorecase = true
doom.smartcase = true  -- especially for the mini.jump
doom.core.reloader.settings.reload_on_save = false
doom.auto_comment=false
-- vim.api.nvim_set_option("formatoptions", "jcrql") -- by default , we should not auto insert comment when press 'o' or O

--
if doom.langs.lua ~= nil then
  doom.langs.lua.settings.disable_lsp = true
end

if doom.features.lsp ~= nil then
  doom.features.lsp.requires_modules = { "features.auto_install" }
  doom.features.lsp.settings.completion.sources = {
    { name = "copilot" },
    { name = "nvim_lua" },
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "path" },
    { name = "buffer" },
  }
  -- doom.features.lsp.settings.completion.completeopt="menu,menuone,preview,noinsert,noselect" -- force user choose an item to complete
  doom.features.lsp.settings.completion.completeopt = "menu,menuone,preview,noinsert,noselect" -- force user choose an item to complete
end

-- not hide file with any prifix
if doom.features.explorer ~= nil then
  doom.features.explorer.settings.filters.custom = {}
end

-- doom.features.
-- -- vim: sw=2 sts=2 ts=2 expandtab
-- --
-- -- custom keybindings for tabline
if doom.features.tabline ~= nil then
  doom.features.tabline.settings.options.enforce_regular_tabs = false
  doom.features.tabline.binds = {
    {
      "H",
      name = "Left",
      function()
        require("bufferline").cycle(-1)
      end,
    },
    {
      "L",
      name = "Left",
      function()
        require("bufferline").cycle(1)
      end,
    },
  }
end
-- -- custom keybindings for comments
-- --
if doom.features.comment ~= nil then
  doom.features.comment.binds = {
    {
      "gc",
      [[<Esc><cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>]],
      name = "Comment line",
      mode = "v",
    },
    {
      "gcc",
      [[<cmd>lua require("Comment.api").toggle.linewise.current()<CR>]],
      name = "Comment line",
    },
    {
      "gcA",
      [[<cmd>lua require("Comment.api").insert.linewise.eol()<CR>]],
      name = "Comment end of line",
      mode = "ni",
    },
  }
end
-- -- custom setting for markdown
-- -- doom.langs.markdown.settings.disable_lsp = true
-- -- custom setting for
--
-- --
if doom.features.whichkey ~= nil then
  doom.features.whichkey.settings.plugins.marks = true
  doom.features.whichkey.settings.plugins.presets.operators = true
  doom.features.whichkey.settings.plugins.registers = true
end

if doom.features.fold ~= nil then
  doom.features.fold.settings.foldlevelstart = 99
end
-- --
-- --
-- --
-- -- some un categorized plugin here
-- -- TODO: Will move them into a module
--

doom.use_package({
  "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
  config = function()
    require("toggle_lsp_diagnostics").init()
  end,
  cond = function()
    return vim.g.vscode ~= 1
  end,
})

-- disable auto insert comment when press 'o' or 'O'
vim.cmd([[
  autocmd FileType * set formatoptions-=o
]])

--
--
-- -- Packer
--
------------------------------------------------------
-- doom.use_package({
--   "folke/noice.nvim",
--   config = function()
--     require("noice").setup({
--
--       notify = { enabled = true, view = "notify" },
--       messages = { enabled = true, view = "mini", view_error = "notify", view_warn = "notify" },
--       -- messages = {enabled = true, view = "mini"},
--       lsp = {
--         -- progress = {enabled = false},
--         hover = { enabled = false },
--         signature = { enabled = false },
--       },
--     })
--   end,
--   requires = {
--     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
--     "MunifTanjim/nui.nvim",
--     -- OPTIONAL:
--     --   `nvim-notify` is only needed, if you want to use the notification view.
--     --   If not available, we use `mini` as the fallback
--     "rcarriga/nvim-notify",
--   },
-- })
------------------------------------------------------
--
--     doom.use_package {
--         'iamcco/markdown-preview.nvim',
--         run = function() vim.fn['mkdp#util#install']() end, -- if it is not work, sometime you need to manual run this command to instal dependency
--         ft = {'markdown', 'md'}
--     }
--     doom.use_package {"SidOfc/mkdx",
--         ft = {'markdown', 'md'}
--     }
--
--   doom.use_package {"rafcamlet/nvim-luapad"}
--   doom.use_package 'anuvyklack/hydra.nvim'
-- -- fold setting
local opt = vim.opt
opt.list = true
opt.listchars:append("eol:↴")

-- tab options
opt.tabstop = 2
opt.shiftwidth = 4
opt.expandtab = true
--
-- confirm when delete
opt.confirm = true
--
-- opt.foldmethod = "expr"
-- opt.foldlevel = 1
-- opt.foldlevelstart = 1
-- opt.foldexpr = "nvim_treesitter#foldexpr()"
--
--
-- vim.cmd([[
--   " hi CursorLine   cterm=NONE ctermbg=green ctermfg=white guibg=green guifg=white
--   " hi CursorLine   cterm=NONE ctermbg=green  guibg=green
--   " hi CursorLine   cterm=NONE  ctermfg=white guibg=green guifg=white
--   hi CursorLine    cterm=underline guibg=#21252a
--
-- ]])

vim.opt.shortmess = "F"

-- special for telescope find_files: in some windows we should not allow it to open
-- TODO: move this snippet into a moduel
local prohitbitedBuf = {
  "term:",
  "NvimTree_",
}

function telescope_find_files_custom()
  local title = vim.fn.bufname("%")
  if #vim.api.nvim_list_wins() > 1 then -- 2 windows or more open, we should no allow open telescope in Neotree, term...
    for i, x in pairs(prohitbitedBuf) do
      if title:find(x) == 1 then
        -- this window title is prohibited
        print("could not open find_files in this window")
        return
      end
    end
  end

  require("telescope.builtin").find_files()
end
--
doom.use_keybind({
  -- The `name` field will add the keybind to whichkey
  { "<leader>ff", name = "find_file_adv", ":lua telescope_find_files_custom()<CR>" },
})


-- avoid "o/O" auto insert comments
--
doom.use_cmd({
  {"CommentAutoOff", function()  vim.opt.formatoptions:remove("o") end},
  {"CommentAutoOn", function()  vim.opt.formatoptions:append("o") end},
})

vim.opt.formatoptions:remove("o")
