vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo.foldtext = ""      -- show the fold's first line with syntax highlighting
vim.wo.foldlevel = 1     -- start with everything open
