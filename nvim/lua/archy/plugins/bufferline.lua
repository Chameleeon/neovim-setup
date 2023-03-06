require("bufferline").setup {
    options = {
        separator_style = 'padded_slant',
        always_show_bufferline = true,
        show_buffer_close_icons = false,
        show_close_icon = false,
        color_icons = true
    },
    highlights = {
        separator = {
            fg = '#3d59a1',
            bg = '#24283b'
        },
        separator_selected = {
            fg = '#3d59a1'
        },
        background = {
            fg = '#657180',
            bg = '#24283b'
        },
        buffer_selected = {
            fg = '#fdf6e3',
            bold = true
        },
        fill = {
            bg = '#24283b'
        }
    }
}

vim.api.nvim_set_keymap('n', '<Tab>', '<cmd>BufferLineCycleNext<cr>', {})
vim.api.nvim_set_keymap('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>q', '<cmd>bd<cr>', {})
