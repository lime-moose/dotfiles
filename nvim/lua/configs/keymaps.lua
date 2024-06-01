--- keymaps options ---
local opts = {
	noremap = true, -- do something, idk :)
	silent = true, -- hide commands on callback
}

--- setting leaderkey ---
vim.g.mapleader = " " -- set spacebar as leaderkey

--- Tab Managent ---
vim.keymap.set("n", "T", ":tabnew<CR>", opts) -- open new tab
vim.keymap.set("n", "Q", ":BufferClose<CR>", opts) -- close tab
vim.keymap.set("n", "L", ":BufferNext<CR>", opts) -- go to next tab
vim.keymap.set("n", "J", ":BufferPrevious<CR>", opts) -- go to previous tab

--- Neotree ---
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", opts) -- toggle neotree
