--- Telescope (File, Greps, etc) ---
return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-ui-select.nvim" },
	config = function()
		--- keymaps ---
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { silent = true }) -- open file picker
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { silent = true }) -- open grep tool

		--- Telescope-ui-select ---
		require("telescope").setup({
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
			},
		})
		require("telescope").load_extension("ui-select")
	end,
}
