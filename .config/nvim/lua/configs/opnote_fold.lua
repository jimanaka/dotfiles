local M = {}

function M.foldexpr()
  local lnum = vim.v.lnum
  local line = vim.fn.getline(lnum)
  local next_line = vim.fn.getline(lnum + 1)

  -- header line (line right before the 48 '=' divider) starts level 1
  if next_line:match("^=+$") and #next_line == 48 then
    return ">1"
  end

  -- the /\/\... divider ends level 1
  if line:match("^[/\\]+$") and #line == 48 then
    return "<1"
  end

  -- a line containing {{{ starts a nested level 2 fold
  if line:match("{{{") then
    return ">2"
  end

  -- a line containing }}} ends level 2
  if line:match("}}}") then
    return "<2"
  end

  -- everything else inherits the level of the line above
  return "="
end

function M.foldtext()
  local foldline = vim.fn.getline(vim.v.foldstart)
  local count = vim.v.foldend - vim.v.foldstart
  return "▸ " .. foldline .. "  (" .. count .. " lines)"
end

return M
