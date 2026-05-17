-- Mini.pick configuration
local pick = require("mini.pick")
local extra = require("mini.extra")

vim.keymap.set("n", "<leader>sf", function()
	pick.builtin.files()
end, { desc = "[S]earch [F]iles" })

vim.keymap.set("n", "<leader>sg", function()
	pick.builtin.grep_live()
end, { desc = "[S]earch by [G]rep" })

vim.keymap.set("n", "<leader>sw", function()
	pick.builtin.grep({ pattern = vim.fn.expand("<cword>") })
end, { desc = "[S]earch current [W]ord" })

vim.keymap.set("n", "<leader>sh", function()
	pick.builtin.help()
end, { desc = "[S]earch [H]elp" })

vim.keymap.set("n", "<leader>sb", function()
	pick.builtin.buffers()
end, { desc = "[S]earch [B]uffers" })

vim.keymap.set("n", "<leader>sd", function()
	extra.pickers.diagnostic()
end, { desc = "[S]earch [D]iagnostics" })

vim.keymap.set("n", "<leader>sk", function()
	extra.pickers.keymaps()
end, { desc = "[S]earch [K]eymaps" })

vim.keymap.set("n", "<leader>sr", function()
	pick.builtin.resume()
end, { desc = "[S]earch [R]esume" })

vim.keymap.set("n", "<leader>sc", function()
	extra.pickers.colorschemes()
end, { desc = "[S]earch [C]olorschemes" })

vim.keymap.set("n", "<leader>/", function()
	extra.pickers.buf_lines({ scope = "current" })
end, { desc = "Search in current buffer" })

vim.keymap.set("n", "<leader>sn", function()
	require("mini.pick").builtin.files(nil, { source = { cwd = vim.fn.stdpath("config") } })
end, { desc = "[S]earch [N]eovim files" })

vim.keymap.set("n", "<leader>sF", function()
	local current_dir = vim.fn.expand("%:p:h")
	require("mini.pick").builtin.files(nil, { source = { cwd = current_dir } })
end, { desc = "[S]earch [F]iles (Current Directory)" })

-- Conform
vim.keymap.set("", "<leader>f", function()
	require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "[F]ormat buffer" })

-- Mini files
vim.keymap.set("n", "<leader>e", function()
	require("mini.files").open(vim.api.nvim_buf_get_name(0))
end, { desc = "Open mini.[E]xplorer (mini.files)" })

-- Navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Misc
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
