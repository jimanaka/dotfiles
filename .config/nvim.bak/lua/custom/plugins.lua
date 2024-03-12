local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

	-- Override plugin definition options

	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end, -- Override to setup mason-lspconfig
	},

	-- override plugin configs
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},

	-- Install a plugin
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

	{
		"stevearc/conform.nvim",
		--  for users those who want auto-save conform + lazyloading!
		-- event = "BufWritePre"
		config = function()
			require("custom.configs.conform")
		end,
	},

	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},

	{
		"rust-lang/rust.vim",
		ft = "rust",
		init = function()
			vim.g.rustmft_autosave = 1
		end,
	},

	{
		"simrat39/rust-tools.nvim",
		ft = "rust",
		dependencies = "neovim/nvim-lspconfig",
		opts = function()
			return require("custom.configs.rust-tools")
		end,
		config = function(_, opts)
			require("rust-tools").setup(opts)
		end,
	},

	{
		"mfussenegger/nvim-dap",
	},

	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	{
		"jhofscheier/ltex-utils.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"nvim-telescope/telescope.nvim",
			-- "nvim-telescope/telescope-fzf-native.nvim", -- optional
		},
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			dictionary = {
				-- Path to the directory where dictionaries are stored.
				-- Defaults to the Neovim cache directory.
				path = vim.api.nvim_call_function("stdpath", { "cache" }) .. "/ltex/",
				---Returns the dictionary file name for given language `lang`
				filename = function(lang)
					return lang .. ".txt"
				end,
				-- use vim internal dictionary to add unkown words
				use_vim_dict = false,
				-- show/suppress vim command output such as `spellgood` or `mkspell`
				vim_cmd_output = false,
			},
			rule_ui = {
				-- key to modify rule
				modify_rule_key = "<CR>",
				-- key to delete rule
				delete_rule_key = "d",
				-- key to cleanup deprecated rules
				cleanup_rules_key = "c",
				-- key to jump to respective place in file
				goto_key = "g",
				-- enable line numbers in preview window
				previewer_line_number = true,
				-- wrap lines in preview window
				previewer_wrap = true,
				-- options for creating new telescope windows
				telescope = { bufnr = 0 },
			},
			diagnostics = {
				-- time to wait for language tool to complete parsing document
				-- debounce time in milliseconds
				debounce_time_ms = 500,
				-- use diagnostics data for modifying hiddenFalsePositives rules
				diags_false_pos = true,
				-- use diagnostics data for modifying disabledRules rules
				diags_disable_rules = true,
			},
		},
	},

  {
    'laytan/tailwind-sorter.nvim',
    dependencies = {'nvim-treesitter/nvim-treesitter', 'nvim-lua/plenary.nvim'},
    build = 'cd formatter && npm i && npm run build',
    config = true,
  },

	-- To make a plugin not be loaded
	-- {
	--   "NvChad/nvim-colorizer.lua",
	--   enabled = false
	-- },

	-- All NvChad plugins are lazy-loaded by default
	-- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
	-- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
	-- {
	--   "mg979/vim-visual-multi",
	--   lazy = false,
	-- }
}

return plugins
