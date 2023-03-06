vim.g.mapleader = " "

local keymap = vim.keymap

-- general keymaps

keymap.set("i", "jk", "<ESC>")

keymap.set("n", "<leader>nh", ":nohl<CR>")

keymap.set ("n", "x", '"_x')

keymap.set("n", "<A-j>", ":m .+1<CR>==")
keymap.set("n", "<A-k>", ":m .-2<CR>==")
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to previous tab

-- plugin keymaps

--nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

keymap.set("n", "<leader>gd", "<cmd>Glance definitions<cr>")
keymap.set("n", "<leader>gr", "<cmd>Glance references<cr>")
keymap.set("n", "<leader>gy", "<cmd>Glance type_definitions<cr>")
keymap.set("n", "<leader>gm", "<cmd>Glance implementations<cr>")

-- nvim-ide

keymap.set("n", "<leader>ie", "<cmd>Workspace<cr>1<cr><cr>")
keymap.set("n", "<leader>ig", "<cmd>Workspace<cr>2<cr><cr>")
keymap.set("n", "<leader>it", "<cmd>Workspace<cr>3<cr><cr>")
keymap.set("n", "<leader>im", "<cmd>Workspace<cr>4<cr><cr>")
keymap.set("n", "<leader>ir", "<cmd>Workspace<cr>5<cr><cr>")
keymap.set("n", "<leader>is", "<cmd>Workspace<cr>6<cr><cr>")
keymap.set("n", "<leader>iT", "<cmd>Workspace<cr>8<cr>")
keymap.set("n", "<leader>ic", "<cmd>Workspace<cr>9<cr>")
keymap.set("n", "<leader>iC", "<cmd>Workspace<cr>10<cr>")
keymap.set("n", "<leader>ib", "<cmd>Workspace<cr>11<cr>")
keymap.set("n", "<leader>iE", "<cmd>Workspace<cr>15<cr>")
keymap.set("n", "<leader>iB", "<cmd>Workspace<cr>16<cr>")
keymap.set("n", "<leader>ih", "<cmd>Workspace<cr>17<cr>")

keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>")
keymap.set("n", "<F9>", ":lua require'dap'.step_over()<CR>")
keymap.set("n", "<F10>", ":lua require'dap'.step_into()<CR>")
keymap.set("n", "<F12>", ":lua require'dap'.step_out()<CR>")
keymap.set("n", "<lader>b", ":lua require'dap'.toggle_breakpint()<CR>")
keymap.set("n", "<leader>B", ":lua require'dap'.set_breakpint(vim.fn.input('Breakpoint condition: '))<CR>")
keymap.set("n", "<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>")

vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
  require('dap.ui.widgets').hover()
end)
vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
  require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end)
