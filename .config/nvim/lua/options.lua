require "nvchad.options"

-- add yours here!

local o = vim.o
o.relativenumber = true
o.cursorlineopt ='both' -- to enable cursorline!

o.breakindent = true
o.undofile = true
o.signcolumn = 'yes'
o.updatetime = 250
o.timeoutlen = 300
-- o.list = true
-- o.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

o.inccommand = 'split'
o.scrolloff = 10

