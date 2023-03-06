require("archy.plugins-setup")
require("archy.core.options")
require("archy.core.keymaps")
require("archy.core.colorscheme")
require("archy.plugins.comment")
require("archy.plugins.nvim-tree")
require("archy.plugins.lualine")
require("archy.plugins.telescope")
require("archy.plugins.nvim-cmp")
require("archy.plugins.lsp.mason")
require("archy.plugins.lsp.lspsaga")
require("archy.plugins.lsp.lspconfig")
require("archy.plugins.treesitter")
require("archy.plugins.prettier")
require("archy.plugins.null-ls")
require("archy.plugins.git")
require("archy.plugins.bufferline")
require("archy.plugins.icons")
require("archy.plugins.gitsigns")
require'cmp'.setup
{
    sources = {
        { name = 'nvim_lsp' }
    }
}
require("archy.plugins.transparent")
require("archy.plugins.glance")
-- require("archy.plugins.nvim-ide")
require("archy.plugins.nvim-dap")
require("archy.plugins.nvim-dap-ui")
require("archy.plugins.dap-ui-conf")
require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
-- require("archy.plugins.lsp.java")
require("archy.plugins.ts-autotag")
require("archy.plugins.autopairs")
require'colorizer'.setup()
vim.opt.termguicolors = true
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]
require'netrw'.setup{
icons = {
    symlink = '', -- Symlink icon (directory and file)
    directory = '', -- Directory icon
    file = '', -- File icon
  },
  use_devicons = true, -- Uses nvim-web-devicons if true, otherwise use the file icon specified above
  mappings = {},
}

local nvim_notify = require("notify")
nvim_notify.setup {
  -- Animation style
  stages = "fade_in_slide_out",
  -- Default timeout for notifications
  timeout = 1500,
  background_colour = "#2E3440",
}

vim.notify = nvim_notify
vim.fn.sign_define('DapBreakpoint', { text = '', color = 'red', texthl = '', linehl = '', numhl = ''})
vim.fn.sign_define('DapStopped',{ text ='▶️', texthl ='', linehl ='', numhl =''})

local dap = require 'dap'
local M = {}
