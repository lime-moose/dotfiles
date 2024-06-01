--- Conform (formatter configuration) ---
return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			--- config formatter by filetype ---
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescriptreact = { "eslint_d" },
				html = { "prettierd" },
				css = { "prettierd" },
			},
			--- format on save ---
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		})
	end,
}
