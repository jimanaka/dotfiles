local map = vim.keymap.set
local opts = { buffer = true, silent = true }

local function insert_datetime_at_line_start()
  local datetime = os.date("%Y-%m-%d %H:%M")
  local row = vim.api.nvim_win_get_cursor(0)[1] - 1  -- 0-indexed row
  vim.api.nvim_buf_set_text(0, row, 0, row, 0, { datetime .. " -- " })
end

local function insert_fold()
  local row = vim.api.nvim_win_get_cursor(0)[1] - 1  -- 0-indexed row
  vim.api.nvim_buf_set_text(0, row, 0 , row, 0, {
    "",
    "================================================",
    "/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\"
  })
end

map("n", "<F3>", insert_datetime_at_line_start,
  vim.tbl_extend("force", opts, { desc = "Insert datetime at line start" }))
map("i", "<F3>", insert_datetime_at_line_start,
  vim.tbl_extend("force", opts, { desc = "Insert datetime at line start" }))

map("n", "<F4>", insert_fold,
  vim.tbl_extend("force", opts, { desc = "Insert fold" }))

map("i", "<F4>", insert_fold,
  vim.tbl_extend("force", opts, { desc = "Insert fold" }))

vim.opt_local.foldmethod = "expr"
vim.opt_local.foldexpr = "v:lua.require('configs.note_fold').foldexpr()"
vim.opt_local.foldtext = "v:lua.require('configs.note_fold').foldtext()"
vim.opt_local.foldlevel = 0

vim.opt_local.number = false
vim.opt_local.relativenumber = false
