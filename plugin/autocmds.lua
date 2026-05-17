vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("BufEnter", {
	desc = "Prevent comment new line from a comment line",
	callback = function()
		vim.opt_local.formatoptions = vim.opt_local.formatoptions - { "r", "o" }
	end,
})

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		require("keymaps")
		if _G.MiniClue then
			MiniClue.ensure_buf_triggers()
		end
	end,
})
