vim.cmd("filetype plugin indent on")

vim.g.python3_host_prog = '/the/path/to/python3'

vim.cmd("syntax on")

vim.opt.diffopt = vim.opt.diffopt + "vertical"

vim.opt.mouse = ''

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'

-- This is cool but has performance drawback :(
-- I still use it though
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

vim.opt.conceallevel = 0
vim.opt.concealcursor = ""

vim.opt.showmode = false
vim.opt.encoding = "utf-8"
vim.opt.scrolloff = 5
vim.opt.splitright = true
vim.opt.splitbelow = true
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
vim.opt.breakindent = true
vim.opt.sbr = '~'

vim.cmd([[autocmd BufEnter * set formatoptions-=cr]])

vim.opt.guicursor = "i-c:block,i-c:blinkon250-blink0ff50,n:blinkon0"
