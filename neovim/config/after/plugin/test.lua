local key = require('lib/keybindings')

key.map('n', '<leader>tn', ':TestNearest<CR>', { silent = true })
key.map('n', '<leader>tf', ':TestFile<CR>', { silent = true })
key.map('n', '<leader>ta', ':TestSuite<CR>', { silent = true })
key.map('n', '<leader>tl', ':TestLast<CR>', { silent = true })
key.map('n', '<leader>tv', ':TestVisit<CR>', { silent = true })

vim.g.ultest_use_pty = 1
