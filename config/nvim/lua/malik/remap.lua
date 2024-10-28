vim.g.mapleader = " " -- Spacebar
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- Exit document 

vim.keymap.set("n", "<leader>u", ":UndotreeShow<CR>") -- View tree

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- Move line up
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- Move line down

vim.keymap.set("n", "Y", "yg$") -- Yank line
vim.keymap.set("n", "J", "mzJ`z") -- Remove newline
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- Page down and center cursor
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- Page up and center cursor
vim.keymap.set("n", "n", "nzzzv") -- Next match
vim.keymap.set("n", "N", "Nzzzv") -- Previous match

vim.keymap.set("x", "<leader>p", "\"_dP") -- Replace selection with clipboard

vim.keymap.set("n", "<leader>y", "\"+y") -- Yank selection into clipboard
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y") -- Yank line into clipboard

vim.keymap.set("n", "<leader>d", "\"_d") -- Delete (selection)
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "Q", "<nop>") -- Disable Q keybinding
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmus neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", function()
	vim.lsp.buf.format()
end)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz") -- Jump to quickfix list items
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>") -- search-replace
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true }) -- Make current file executable

