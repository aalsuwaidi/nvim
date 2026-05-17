vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.loader.enable()
vim.g.have_nerd_font = false

-- [[Options]]
vim.o.showmode = false
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = "yes"
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.o.inccommand = "split"
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.confirm = true
vim.o.pumblend = 10
vim.o.winblend = 10
vim.o.termguicolors = true
vim.o.smoothscroll = true
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldenable = false

-- [Line numbers]
vim.o.number = true
vim.o.relativenumber = true
-- [Mouse]
vim.o.mouse = "a"
