# Based on https://framagit.org/vegaelle/nix-nvim/

{ config, pkgs, lib, vimUtils, ... }:
let
 vim-plugins = import ./plugins.nix { inherit pkgs lib; };
  unstable = import <nixos-unstable> {};
  master = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/master.tar.gz") {};
  # installs a vim plugin from git with a given tag / branch
  pluginGit = ref: repo: unstable.vimUtils.buildVimPluginFrom2Nix {
    pname = "${lib.strings.sanitizeDerivationName repo}";
    version = ref;
    src = builtins.fetchGit {
      url = "https://github.com/${repo}.git";
      ref = ref;
    };
  };
  # always installs latest version
  plugin = pluginGit "HEAD";
in {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    
    withNodeJs = true;
    withPython3 = true;
    withRuby = true;

    extraPackages = with unstable; [
      cmake-language-server
      sqls # sql lsp server
      gopls # go lsp server
      nodePackages.bash-language-server
      nodePackages.vscode-css-languageserver-bin
      nodePackages.vscode-html-languageserver-bin
      nodePackages.vscode-json-languageserver
      unstable.python-language-server
      python39Packages.pynvim
      python39Packages.python-lsp-server
      rust-analyzer
      sumneko-lua-language-server
      texlab # latex lsp server
      unstable.tree-sitter # syntax highlighter
    ];
    plugins = with unstable.vimPlugins; [
      # Packer can manage itself as an optional plugin
      #(plugin "wbthomason/packer.nvim")#, opt = true)
      packer-nvim
      vim-vinegar
      # Make sure you use single quotes
      # Utility
      vista-vim
      vim-dispatch
      vim-surround
      nerdcommenter
      vim-easymotion
      indentLine
      formatter-nvim

      # Generic Programming Support
      # Vim plugin, insert or delete brackets, parens, quotes in pair
      nvim-autopairs
      # add end in ruby, lua, etc...
      vim-plugins.nvim-treesitter-endwise

      # Markdown / Writting
      orgmode
      vim-markdown
      vim-LanguageTool
      vimtex

      # Git Support
      vim-fugitive
      vim-gitgutter
      plenary-nvim
      neogit
      # gitlens for nvim
      vim-plugins.blamer-nvim

      # Collection of common configurations for the Nvim LSP client
      luasnip
      # vscode like snippets
      friendly-snippets
      nvim-lspconfig
      lsp-status-nvim

      # Install Lsp servers
      ##vim-plugins.nvim-lsp-installer

      # Lsp config
      nvim-cmp
      cmp-buffer
      cmp-path
      cmp-calc
      cmp-nvim-lsp-document-symbol
      cmp-nvim-lua
      cmp-nvim-lsp
      vim-plugins.cmp-rg
      cmp_luasnip
      lspkind-nvim
      colorbuddy-nvim

      # For vsnip user.
      cmp-vsnip
      vim-vsnip

      # Extentions to built-in LSP, for example, providing type inlay hints
      vim-plugins.lsp-extensions-nvim

      # Filemanager
      vifm-vim
      # Search through files
      popup-nvim
      telescope-nvim

      # Python
      # pep8 indentation
      vim-python-pep8-indent

      # rust
      rust-vim

      # Theme / Interface
      nvim-colorizer-lua
      nvim-treesitter
      one-nvim
      nvim-web-devicons
      nvim-gps
      feline-nvim

      vim-devicons
      onedark-vim
      # launch terminal from neovim
      nvim-lightbulb

      emmet-vim

      vim-test
      vim-ultest
    ];
  };

  xdg.configFile.nvim = {
    source = ./config;
    recursive = true;
  };
}