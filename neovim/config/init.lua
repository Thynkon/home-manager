if vim.api.nvim_eval('!exists("g:vscode")') then
  vim.api.nvim_command('set packpath^=/nix/store/cc478fia9anyblid0zzbr3ixm315frbj-vim-pack-dir')
  vim.api.nvim_command('set runtimepath^=/nix/store/cc478fia9anyblid0zzbr3ixm315frbj-vim-pack-dir')
end

require("lib/aliases")
require("keymap.standard")

if vim.api.nvim_eval('!exists("g:vscode")') then
  require("basic")
  require("keymap.telescope")
  require("theme/theme")

  -- LSP clients configuration
  require("lsp")
end