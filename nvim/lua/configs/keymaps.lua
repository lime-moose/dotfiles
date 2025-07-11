-- common options for keymaps
local opts = {
	silent = true, -- make every keybinding 'silent'
}

vim.g.mapleader = " " -- creating our leader key

vim.keymap.set("n", "<leader>n", ":Neotree toggle <CR>", opts) -- toggle Neotree
vim.keymap.set("n", "<leader>ff", ":Telescope find_files <CR>", opts) -- telescope find files
vim.keymap.set("n", "<leader>fb", ":Telescope buffers <CR>", opts) -- telescope buffers
vim.keymap.set("n", "<leader>ca", function()
	vim.lsp.buf.code_action()
end, opts) -- open code actions
vim.keymap.set("n", "<leader>fd", function()
	vim.lsp.buf.format()
end, opts) -- open code actions

vim.keymap.set("n", "<leader>t", ":tabnew <CR>", opts) -- open new tab
vim.keymap.set("n", "<leader>w", ":tabclose <CR>", opts) -- close other tabs
vim.keymap.set("n", "<leader>l", ":tabnext <CR>", opts) -- go to next tab
vim.keymap.set("n", "<leader>h", ":tabprev <CR>", opts) -- go to previous tab
