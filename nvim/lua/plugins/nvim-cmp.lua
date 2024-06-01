--- Nvim-cmp (suggestions & completions) ---
return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-path", -- file path suggestion
		"hrsh7th/cmp-buffer", -- text suggestions
		"hrsh7th/cmp-nvim-lsp", -- completion tool for lspconfig
		"saadparwaiz1/cmp_luasnip", -- completion tool for luasnip
		"L3MON4D3/LuaSnip", -- snippet plugin for lua
		"rafamadriz/friendly-snippets", -- vs code like snippets
	},

	config = function()
		local cmp = require("cmp")
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			}),
		})
	end,
}
