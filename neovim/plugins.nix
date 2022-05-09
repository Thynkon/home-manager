{ pkgs, lib }:

{
  # vim-bepoptimist = pkgs.vimUtils.buildVimPlugin rec {
  #   pname = "vim-bepoptimist";
  #   version = "v2.1.1";
  #   src = pkgs.fetchFromGitHub {
  #       owner = "vegaelle";
  #       repo = "vim-bepoptimist";
  #       rev = "${version}";
  #       sha256 = "1nmpvnqlw4y2g1ki33nbj74vdnaxnaqshqv3238zxgvps44y3mw5";
  #   };
  #   meta.homepage = "https://github.com/sheoak/vim-bepoptimist";
  #   };

  # nix-prefetch-url --unpack <URL>
  nvim-treesitter-endwise = pkgs.vimUtils.buildVimPlugin rec {
    pname = "nvim-treesitter-endwise";
    version = "0.1";
    src = pkgs.fetchFromGitHub {
        owner = "RRethy";
        repo = "nvim-treesitter-endwise";
        rev = "b6ce73e9a1fe88b4548b25afcf46e8f9444fb5b9";
        sha256 = "1hz9yb9ivk00zncdn2jh10rbdacdfchgyahrm4ysz2aicq8hg7sz";
    };
    meta.homepage = "https://github.com/RRethy/nvim-treesitter-endwise";
  };

  blamer-nvim = pkgs.vimUtils.buildVimPlugin rec {
    pname = "blamer-nvim";
    version = "0.1";
    src = pkgs.fetchFromGitHub {
        owner = "APZelos";
        repo = "blamer.nvim";
        rev = "f4eb22a9013642c411725fdda945ae45f8d93181";
        sha256 = "1czjagkfjw57f2nvjjgbma1gcy1ylcd68dyfc5ivr2wc6fdw5lks";
    };
    meta.homepage = "https://github.com/APZelos/blamer.nvim";
  };

  nvim-lsp-installer = pkgs.vimUtils.buildVimPlugin rec {
    pname = "nvim-lsp-installer";
    version = "0.1";
    src = pkgs.fetchFromGitHub {
        owner = "williamboman";
        repo = "nvim-lsp-installer";
        rev = "e7a402341b6d0e7fab137aace7ef98671f4e172f";
        sha256 = "19ybikgrxwyj2v2l2h1ywgkd66hiy98z07rxc6dpld7k1qxd0qjp";
    };
    meta.homepage = "https://github.com/williamboman/nvim-lsp-installer";
  };

  cmp-rg = pkgs.vimUtils.buildVimPlugin rec {
    pname = "cmp-rg";
    version = "1.3.6";
    src = pkgs.fetchFromGitHub {
        owner = "lukas-reineke";
        repo = "cpm-rg";
        rev = "72230d556a137e7b8aef12d0cfc6c770be754898";
        sha256 = "0z8knl4l5a7miw081h290s0g4icqqvn6qibr6jx4x71qwqb21w2y";
    };
    meta.homepage = "https://github.com/lukas-reineke/cmp-rg";
  };

  lsp-extensions-nvim = pkgs.vimUtils.buildVimPlugin rec {
    pname = "lsp-extensions-nvim";
    version = "0.1";
    src = pkgs.fetchFromGitHub {
        owner = "tjdevries";
        repo = "lsp_extensions.nvim";
        rev = "4011f4aec61ba59c734f5dbf52e91f258b99d985";
        sha256 = "0nzxadzc2namm1lxrklw6gqwdw6wvl2ddpg7c0alhw5c1j05lb64";
    };
    meta.homepage = "https://github.com/nvim-lua/lsp_extensions.nvim/";
  };
}

