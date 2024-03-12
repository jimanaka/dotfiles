local configs = require("nvchad.configs.lspconfig")
local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

local lspconfig = require("lspconfig")
-- local util = require("lspconfig/util")

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd", "pylsp", "tailwindcss", "ltex" }

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_init = on_init,
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

lspconfig.pylsp.setup({
	settings = {
		pylsp = {
			plugins = {
				pycodestyle = {
					ignore = { "E501" },
				},
			},
		},
	},
})

lspconfig.tailwindcss.setup({
	filetypes = { "javascript", "typescript", "html", "css" },
})

lspconfig.ltex.setup({
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
		require("ltex-utils").on_attach(bufnr)
	end,
})

require("tailwind-sorter").setup({
	on_save_enabled = false, -- If `true`, automatically enables on save sorting.
	on_save_pattern = { "*.html", "*.js", "*.jsx", "*.tsx", "*.twig", "*.hbs", "*.php", "*.heex", "*.astro" }, -- The file patterns to watch and sort.
	node_path = "node",
})

-- lspconfig.rust_analyzer.setup {
--   filetypes = { "rust" },
--   root_dir = util.root_pattern("Cargo.toml"),
--   settings = {
--     ['rust-analyzer'] = {
--       cargo = {
--         allFeatures = true
--       }
--     }
--   }
-- }

--
-- lspconfig.pyright.setup { blabla}
