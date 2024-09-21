return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    -- plenary.nvim
    use("nvim-lua/plenary.nvim")

    -- File manager
    use({
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        }
    })
    -- Statusline
    use({
        "nvim-lualine/lualine.nvim",
        requires = {"nvim-tree/nvim-web-devicons", opt = true},
    })
    -- tab bar
    use ({
        'akinsho/bufferline.nvim', tag = "*",
        requires = 'nvim-tree/nvim-web-devicons'
    })
    -- telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    -- Terminal  toggleterm
    use({
        "akinsho/toggleterm.nvim",
        tag = '*',
    })
    -- popup
    use("nvim-lua/popup.nvim")

    -- aotupairs
    use("windwp/nvim-autopairs")

    ------------- lsp --------------
    use({
        "williamboman/mason.nvim",  -- Mason
        "williamboman/mason-lspconfig.nvim",  -- Mason
        "neovim/nvim-lspconfig",  -- lspconfig
    })
    -- cmp  Autocomplete
    use("hrsh7th/nvim-cmp")
    use "hrsh7th/cmp-nvim-lsp"  -- nvim_lsp
    -- lsp_signature
    use("ray-x/lsp_signature.nvim")
    -- null-ls
    use({
        "jose-elias-alvarez/null-ls.nvim",
        requires = { "nvim-lua/plenary.nvim" },
    })
    ------------- lsp --------------

    -- treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        --run = ':TSUpdate'
    }
    -- notify
    use("rcarriga/nvim-notify")
    -- fidget
    use({
        "j-hui/fidget.nvim",
        tag = "legacy"
    })
end)
