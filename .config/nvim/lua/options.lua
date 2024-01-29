vim.cmd("filetype plugin indent on")

vim.g.python3_host_prog = '/home/tduchuy/Data/nvim-pyenv/bin/python3'

vim.cmd("syntax on")

vim.opt.diffopt = vim.opt.diffopt + "vertical"

vim.opt.mouse = ''

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'

vim.opt.cursorline = false 

vim.opt.showmode = false
vim.opt.encoding = "utf-8"
vim.opt.scrolloff = 5
vim.opt.splitright = true
vim.opt.showtabline = 2
vim.opt.listchars = "eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣"

local indent = 4
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.tabstop = indent
vim.opt.softtabstop = indent
vim.opt.shiftwidth = indent

vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.wildmenu = true

vim.opt.wrap = true
vim.opt.linebreak = true

vim.opt.guicursor = "i-ci:block,i-ci:blinkon250-blink0ff50,n:blinkon0"
