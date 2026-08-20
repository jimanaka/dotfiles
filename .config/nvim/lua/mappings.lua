require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle nvimtree"})

-- prevent delets and pases from overwriting the main buffer
map({ "n", "v" }, "d", '"ad', { desc = "Delete to register a" })
map("n", "dd", '"add', { desc = "Delete line to register a" })
map("n", "D", '"aD', { desc = "Delete to EOL to register a" })
map({ "n", "v" }, "c", '"ac', { desc = "Change to register a" })
map("n", "cc", '"acc', { desc = "Change line to register a" })
map("n", "C", '"aC', { desc = "Change to EOL to register a" })
map({ "n", "v" }, "x", '"ax', { desc = "Delete char to register a" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
