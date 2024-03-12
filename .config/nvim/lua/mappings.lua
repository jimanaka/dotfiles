local map = vim.keymap.set

-- normal mode
map("n", "<leader>e", "<cmd> NvimTreeToggle <CR>", { desc = "Toggle nvimtree" })

-- -- toggle nvim tree
map("n", "<leader>fm", function()
	require("conform").format()
end, { desc = "formatting" })

-- -- tmux navigation
map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "Window left" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "Window right" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "Window down" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "Window up" })

-- -- DAP
map("n", "<leader>db", "<cmd> DapToggleBreakpoint<CR>", { desc = "Toggle breakpoint" })
map("n", "<leader>dus", function()
	local widgets = require("dat.ui.widgets")
	local sidebar = widgets.sidebar(widgets.scopes)
	sidebar.open()
end, { desc = "Toggle DAP" })

-- -- moveline
map("n", "<M-k>", "<cmd> moveline.up<CR>", { desc = "moveline up" })
map("n", "<M-j>", "<cmd> moveline.down<CR>", { desc = "moveline down" })

-- visual mode
-- -- indent
map("v", ">", ">gv", { desc = "indent" })
-- -- moveline
map("v", "<M-k>", "<cmd> moveline.up<CR>", { desc = "moveline up" })
map("v", "<M-j>", "<cmd> moveline.down<CR>", { desc = "moveline down" })

-- insert mode
-- -- esc
map("i", "jk", "<Esc>", { nowait = true })
map("i", "kj", "<Esc>", { nowait = true })

-- multiple modes
map({ "i", "n" }, "<C-k>", "<Up>", { desc = "Move down" })

map("n", "<leader>ff", ":Telescope <cr>")

-- mapping with a lua function
map("n", "<A-i>", function()
	require("nvchad.term").toggle({ pos = "sp", id = "abc" })
end, { desc = "Terminal toggle floating" })

-- Disable mappings
local nomap = vim.keymap.del

nomap("i", "<C-k>")
nomap("n", "<C-k>")
