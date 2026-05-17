vim.pack.add({
	"https://github.com/nvim-mini/mini.nvim",
	"https://github.com/nvim-mini/mini.icons",
	"https://github.com/nvim-mini/mini.snippets",
	"https://github.com/nvim-mini/mini.completion",
	"https://github.com/nvim-mini/mini.pick",
	"https://github.com/nvim-mini/mini.extra",
	"https://github.com/nvim-mini/mini.ai",
	"https://github.com/nvim-mini/mini.surround",
	"https://github.com/nvim-mini/mini.pairs",
	"https://github.com/nvim-mini/mini.align",
	"https://github.com/nvim-mini/mini.move",
	"https://github.com/nvim-mini/mini.comment",
	"https://github.com/nvim-mini/mini.bracketed",
	"https://github.com/nvim-mini/mini.clue",
	"https://github.com/nvim-mini/mini.jump",
	"https://github.com/nvim-mini/mini.jump2d",
	"https://github.com/nvim-mini/mini.files",
	"https://github.com/nvim-mini/mini.map",
	"https://github.com/nvim-mini/mini.statusline",
	"https://github.com/nvim-mini/mini.tabline",
})
local miniclue = require("mini.clue")

require("mini.pick").setup()
require("mini.extra").setup()
require("mini.ai").setup()
require("mini.surround").setup()
require("mini.pairs").setup()
require("mini.align").setup()
require("mini.icons").setup()
require("mini.snippets").setup()
require("mini.completion").setup()
require("mini.move").setup()
require("mini.comment").setup()
require("mini.bracketed").setup()
miniclue.setup({
	triggers = {
		{ mode = { "n", "x" }, keys = "<Leader>" },
		{ mode = { "n", "x" }, keys = "g" },
		{ mode = { "n", "x" }, keys = "z" },
		{ mode = { "n", "x" }, keys = "'" },
		{ mode = { "n", "x" }, keys = "`" },
		{ mode = { "n", "x" }, keys = '"' },
		{ mode = "n", keys = "<C-w>" },
		{ mode = "i", keys = "<C-x>" },
		{ mode = "n", keys = "[" },
		{ mode = "n", keys = "]" },
	},

	clues = {
		miniclue.gen_clues.builtin_completion(),
		miniclue.gen_clues.g(),
		miniclue.gen_clues.marks(),
		miniclue.gen_clues.registers(),
		miniclue.gen_clues.windows({
			submode_move = true,
			submode_navigate = true,
			submode_resize = true,
		}),
		miniclue.gen_clues.z(),
		miniclue.gen_clues.square_brackets(),

		{ mode = "n", keys = "<Leader>s", desc = "+Search" },
		{ mode = "n", keys = "<Leader>", desc = "+Leader" },
	},

	window = {
		delay = 300,
		config = {
			width = "auto",
			border = "rounded",
		},
	},
})
require("mini.jump").setup()
require("mini.jump2d").setup()
require("mini.files").setup()
require("mini.statusline").setup()
require("mini.tabline").setup()
