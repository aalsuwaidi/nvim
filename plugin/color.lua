vim.pack.add({
	"https://github.com/norcalli/nvim-colorizer.lua",
	"https://github.com/folke/tokyonight.nvim",
})

require("colorizer").setup()
require("tokyonight").setup({
	style = "storm",
	transparent = false,
})

vim.cmd.colorscheme("tokyonight")
