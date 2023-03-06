-- auto install packer if not installed
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer()

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
    return
end

return packer.startup(function(use)
    use("wbthomason/packer.nvim")

    -- lua functions that many plugins use
    use("nvim-lua/plenary.nvim")

    -- tmux & split window navigation
    use("christoomey/vim-tmux-navigator")

    use("szw/vim-maximizer") -- maximizes and restores current window

    -- file explorer
    use("nvim-tree/nvim-tree.lua")

    --icons
    use("kyazdani42/nvim-web-devicons")

    --status-line
    use("nvim-lualine/lualine.nvim")

    -- fuzzy finding
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
    use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })
    use("nvim-telescope/telescope-file-browser.nvim")

    -- autocompletion
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")

    -- snippets
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    use("rafamadriz/friendly-snippets")

    -- managing & installing lsp severs
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")

    -- configuring lsp servers
    use("neovim/nvim-lspconfig")
    use("hrsh7th/cmp-nvim-lsp")
    use({ "glepnir/lspsaga.nvim", branch = "main" })
    use("jose-elias-alvarez/typescript.nvim")
    use("onsails/lspkind.nvim")
    use("mfussenegger/nvim-jdtls")

    -- essential plugins
    use("tpope/vim-surround")
    use("vim-scripts/ReplaceWithRegister")

    -- commentnig with gc
    use("numToStr/Comment.nvim")

    -- color scheme
    use("folke/tokyonight.nvim")

    -- omnisharp
    use("OmniSharp/omnisharp-vim")

    -- nvim-tree
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
    --transparent
    use("xiyaowong/nvim-transparent")

    -- startify
    use("mhinz/vim-startify")

    -- colorizer - enables color preview of hex values inside of vim
    use("norcalli/nvim-colorizer.lua")

    use("dinhhuy258/git.nvim")

    -- nvim-ide
    use("ldelossa/nvim-ide")
    use("rcarriga/nvim-notify") -- pretty notifications
    use("DNLHC/glance.nvim") -- nvim glance
    use("lewis6991/gitsigns.nvim") -- git integration
    use { 'ibhagwan/fzf-lua',
        requires = { 'nvim-tree/nvim-web-devicons' }
    }
    --debugging
    use("mfussenegger/nvim-dap")
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
    use("leoluz/nvim-dap-go")
    use("theHamsta/nvim-dap-virtual-text")
    use("nvim-telescope/telescope-dap.nvim")
    use("prichrd/netrw.nvim")
    use("mfussenegger/nvim-dap-python")

    use("windwp/nvim-autopairs")
    use("windwp/nvim-ts-autotag")

    use("jose-elias-alvarez/null-ls.nvim")
    use("MunifTanjim/prettier.nvim")

    use("akinsho/nvim-bufferline.lua")

    if packer_bootstrap then
        require("packer").sync()
    end
end)
