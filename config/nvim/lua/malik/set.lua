vim.opt.nu = true
vim.opt.relativenumber = false

local tab_width = 8
vim.opt.tabstop = tab_width
vim.opt.softtabstop = tab_width
vim.opt.shiftwidth = tab_width

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 3
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.g.mapleader = " "

vim.opt.clipboard:append { 'unnamed', 'unnamedplus' }

