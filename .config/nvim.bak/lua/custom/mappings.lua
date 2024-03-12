---@type MappingsTable
local M = {}

M.general = {
  -- normal mode
  n = {
    -- [";"] = { ":", "enter command mode", opts = { nowait = true } },

    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },

    -- toggle nvim tree
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },

    -- tmux navigation
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left"},
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right"},
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down"},
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up"},

    -- DAP
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>" },
    ["<leader>dus"] = {
      function ()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar"
    },

    -- moveline
    ["<M-k"] = {"<cmd> moveline.up<CR>", "moveline up"},
    ["<M-j"] = {"<cmd> moveline.down<CR>", "moveline down"},
  },
  -- visual mode
  v = {
    [">"] = { ">gv", "indent"},

    -- moveline
    ["<M-k"] = {"<cmd> moveline.block_up<CR>", "moveline block up"},
    ["<M-j"] = {"<cmd> moveline.block_down<CR>", "moveline block down"},
  },
  i = {
    ["jk"] = {"<Esc>", "enter normal mode", opts = { nowait = true }},
    ["kj"] = {"<Esc>", "enter normal mode", opts = { nowait = true }},
  }
}

M.lspconfig = {
  plugin = true,
  n = {
    ["<leader>wa"] = {
      function()
        vim.lsp.buf.add_workspace_folder()
      end,
      "Add workspace folder",
    },

    ["<leader>wr"] = {
      function()
        vim.lsp.buf.remove_workspace_folder()
      end,
      "Remove workspace folder",
    },

    ["<leader>wl"] = {
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      "List workspace folders",
    },
  },

}

-- more keybinds!

return M
