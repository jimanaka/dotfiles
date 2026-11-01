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

  -- a header line immediately followed by {{{ starts level 2
  -- (the header itself is now INCLUDED in the fold, not just the {{{ body)
  if line:match("{{{%s*$") then
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
  local line = vim.fn.getline(vim.v.foldstart)
  line = vim.trim((line:gsub("{{{%s*$", "")))   -- drop the marker
  local count = vim.v.foldend - vim.v.foldstart + 1
  local indent = string.rep("  ", vim.v.foldlevel - 1)
  return indent .. "▸ " .. line .. "  (" .. count .. " lines)"
end

return M
