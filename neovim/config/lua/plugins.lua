-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]
local packer = require("packer")

packer.startup(
  function()
    -- Packer can manage itself as an optional plugin
    (plugin "wbthomason/packer.nvim", opt = true}
    -- Make sure you use single quotes
    -- Utility
    (plugin "tpope/vim-vinegar"}
    (plugin "liuchengxu/vista.vim"}
    (plugin "wesQ3/vim-windowswap"}
    (plugin "tpope/vim-dispatch"}
    (plugin "tpope/vim-surround"}
    (plugin "preservim/nerdcommenter"}
    (plugin "easymotion/vim-easymotion"}
    (plugin "Yggdroot/indentLine"}
    (plugin "mhartington/formatter.nvim"}

    -- Generic Programming Support
    -- Vim plugin, insert or delete brackets, parens, quotes in pair
    (plugin "windwp/nvim-autopairs"}
    -- add end in ruby, lua, etc...
    (plugin "RRethy/nvim-treesitter-endwise"}

    -- Markdown / Writting
    (plugin "nvim-orgmode/orgmode"}
    (plugin "tpope/vim-markdown"}
    (plugin "dpelle/vim-LanguageTool"}
    (plugin "lervag/vimtex"}

    -- Git Support
    (plugin "tpope/vim-fugitive"}
    (plugin "airblade/vim-gitgutter"}
    (plugin "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim"}
    -- gitlens for nvim
    (plugin "APZelos/blamer.nvim"}

    -- Collection of common configurations for the Nvim LSP client
    (plugin "L3MON4D3/LuaSnip"}
    -- vscode like snippets
    (plugin "rafamadriz/friendly-snippets"}
    (plugin "neovim/nvim-lspconfig"}
    (plugin "wbthomason/lsp-status.nvim"}

    -- Install Lsp servers
    (plugin "williamboman/nvim-lsp-installer"}

    -- Lsp config
    (plugin "hrsh7th/nvim-cmp"}
    (plugin "hrsh7th/cmp-buffer"}
    (plugin "hrsh7th/cmp-path"}
    (plugin "hrsh7th/cmp-calc"}
    (plugin "hrsh7th/cmp-nvim-lsp-document-symbol"}
    (plugin "hrsh7th/cmp-nvim-lua"}
    (plugin "hrsh7th/cmp-nvim-lsp"}
    (plugin "lukas-reineke/cmp-rg"}
    (plugin "saadparwaiz1/cmp_luasnip"}
    (plugin "onsails/lspkind-nvim"}
    (plugin "tjdevries/colorbuddy.nvim"}

    -- For vsnip user.
    (plugin "hrsh7th/cmp-vsnip"}
    (plugin "hrsh7th/vim-vsnip"}

    -- Extentions to built-in LSP, for example, providing type inlay hints
    (plugin "tjdevries/lsp_extensions.nvim"}

    -- Filemanager
    (plugin "vifm/vifm.vim"}
    -- Search through files
    (plugin 
      "nvim-telescope/telescope.nvim",
      requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}
    }

    -- Remote editing
    (plugin 'chipsenkbeil/distant.nvim'}

    -- Python
    -- pep8 indentation
    (plugin "Vimjas/vim-python-pep8-indent"}

    -- rust
    (plugin "rust-lang/rust.vim"}

    -- Theme / Interface
    (plugin "norcalli/nvim-colorizer.lua"}
    (plugin 
      "nvim-treesitter/nvim-treesitter",
      run = function()
        vim.api.nvim_command("TSUpdate")
      end
    }
    (plugin "Th3Whit3Wolf/one-nvim"}
    (plugin "kyazdani42/nvim-web-devicons"}
    use(
      {
        "famiu/feline.nvim",
        tag = "v0.3.3",
        requires = {"SmiteshP/nvim-gps", opt = true}
      }
    )

    (plugin "ryanoasis/vim-devicons"}
    (plugin "joshdick/onedark.vim"}
    -- launch terminal from neovim
    (plugin "kosayoda/nvim-lightbulb"}

    (plugin "mattn/emmet-vim"}

    (plugin "vim-test/vim-test"}
    (plugin  "rcarriga/vim-ultest", requires = {"vim-test/vim-test"}, run = ":UpdateRemotePlugins" }
  end
)

return packer
