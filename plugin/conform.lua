vim.pack.add({
	"https://github.com/stevearc/conform.nvim",
})

require("conform").setup({
	notify_on_error = false,

	format_on_save = function(bufnr)
		local disable_filetypes = { c = true, cpp = true }
		return {
			timeout_ms = 500,
			lsp_format = disable_filetypes[vim.bo[bufnr].filetype] and "never" or "fallback",
		}
	end,

	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettier" },
		svelte = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },
		go = { "goimports", "gofumpt" },
	},

	formatters = {
		prettier = {
			command = "prettier",
			prepend_args = {
				"--print-width",
				"150",
				"--prose-wrap",
				"preserve",
				"--bracket-same-line",
			},
			args = {
				"--plugin",
				"prettier-plugin-svelte",
				"--stdin-filepath",
				"$FILENAME",
			},
			stdin = true,
		},
	},
})
