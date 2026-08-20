local map = vim.keymap.set
local opts = { buffer = true, silent = true }

local function insert_datetime_at_line_start()
  local datetime = os.date("%Y-%m-%d %H:%M")
  local row = vim.api.nvim_win_get_cursor(0)[1] - 1  -- 0-indexed row
  vim.api.nvim_buf_set_text(0, row, 0, row, 0, { datetime .. " -- " })
end

map("n", "<F3>", insert_datetime_at_line_start,
  vim.tbl_extend("force", opts, { desc = "Insert datetime at line start" }))

map("i", "<F3>", insert_datetime_at_line_start,
  vim.tbl_extend("force", opts, { desc = "Insert datetime at line start" }))
vim.opt_local.foldmethod = "expr"
vim.opt_local.foldexpr = "v:lua.require('configs.opnote_fold').foldexpr()"
vim.opt_local.foldtext = "v:lua.require('configs.opnote_fold').foldtext()"
vim.opt_local.foldlevel = 0

