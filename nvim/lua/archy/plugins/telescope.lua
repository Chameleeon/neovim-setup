local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
    return
end
local actions = require('telescope.actions')

function Telescope_buffer_dir()
    return vim.fn.expand('%:p:h')
end

local fb_actions = require 'telescope'.extensions.file_browser.actions

telescope.setup({
    defaults = {
        mappings = {
            i = {
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            },
            n = {
                ['q'] = actions.close
            }
        }
    },
    extensions = {
        file_browser = {
            -- theme = 'dropdwn',
            hijack_netrw = true,
            mappings = {
                ['i'] = {
                    ['<C-w>'] = function() vim.cmd('normal vbd') end,
                },
                ['n'] = {
                    ['N'] = fb_actions.create,
                    ['n'] = fb_actions.goto_parent_dir,
                    ['/'] = function()
                        vim.cmd('startinsert')
                    end
                }
            }
        }
    }
})

telescope.load_extension('file_browser')


local opts = {noremap = true, silent = true}
vim.keymap.set('n', ';f', '<cmd>lua require("telescope.builtin").find_files({no_ignore = false, hidden = true})<cr>', opts)
vim.keymap.set('n', ';r', '<cmd>lua require("telescope.builtin").live_grep()<cr>', opts)
vim.keymap.set('n', ';b', '<cmd>lua require("telescope.builtin").buffers()<cr>', opts)
vim.keymap.set('n', ';t', '<cmd>lua require("telescope.builtin").help_tags()<cr>', opts)
vim.keymap.set('n', ';;', '<cmd>lua require("telescope.builtin").resume()<cr>', opts)
vim.keymap.set('n', ';e', '<cmd>lua require("telescope.builtin").diagnostics()<cr>', opts)
vim.keymap.set('n', 'sf', '<cmd>lua require("telescope").extensions.file_browser.file_browser({ path = "%:p:h", cwd = Telescope_buffer_dir(), respect_git_ignore = false, hidden = true, grouped = true, previewer = false, initial_mode = "normal", layout_config = { height = 40} })<cr>', opts)
