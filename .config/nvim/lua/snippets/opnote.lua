local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local function datetime()
  return os.date("%Y-%m-%d %H:%M")
end

return {
  -- "target" -> expands into a target info block
  s("target", {
    i(1, "10.10.11.x"), t(" - "), i(2, "hostname"),
    t({
      "",
      "================================================",
      "",
      "/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\",
      "",
      "",
    }),
  }),

}
