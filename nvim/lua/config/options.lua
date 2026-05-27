-- Reduce delay after Esc
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 0
vim.opt.termguicolors = true
vim.opt.updatetime = 50

-- General
vim.opt.compatible = false
vim.cmd("syntax on")
vim.opt.background = "dark"
vim.cmd("colorscheme github_dark")

vim.cmd("highlight EndOfBuffer ctermbg=NONE guibg=NONE")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.showcmd = true
vim.opt.showmatch = true

-- Indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.cindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- UI
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.termguicolors = true

-- Over
--vim.cmd("highlight Visual guibg=#482046 guifg=NONE")

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Undo
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")

-- Cursor
vim.opt.guicursor = "n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50"
