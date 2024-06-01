--- Treesitter (Syntax Highlighing) ---
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = { "lua", "markdown", "c", "bash", "html", "css", "javascript", "php" },
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
