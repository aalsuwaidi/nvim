vim.pack.add({
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/neovim/nvim-lspconfig",
})

require("mason").setup()

vim.lsp.enable({
	"gopls",
	"lua_ls",
	"html",
	"cssls",
	"ts_ls",
	"svelte",
	"markdown_oxide",
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc, mode)
			mode = mode or "n"
			vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end
		local client = vim.lsp.get_client_by_id(event.data.client_id)

		map("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
		map("<leader>gd", function()
			require("mini.extra").pickers.lsp({ scope = "definition" })
		end, "[G]oto [D]efinition")
		map("gr", vim.lsp.buf.references, "[G]oto [R]eferences")
		map("<leader>gr", function()
			require("mini.extra").pickers.lsp({ scope = "references" })
		end, "[G]oto [R]eferences")

		map("<leader>ds", function()
			require("mini.extra").pickers.lsp({ scope = "document_symbol" })
		end, "[D]ocument [S]ymbols")
		map("<leader>ws", function()
			require("mini.extra").pickers.lsp({ scope = "workspace_symbol_live" })
		end, "[W]orkspace [S]ymbols (live)")

		if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_implementation) then
			map("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
			map("<leader>gI", function()
				require("mini.extra").pickers.lsp({ scope = "implementation" })
			end, "[G]oto [I]mplementation")
		end

		if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_typeDefinition) then
			map("gTD", vim.lsp.buf.type_definition, "Type [D]efinition")
			map("<leader>TD", function()
				require("mini.extra").pickers.lsp({ scope = "type_definition" })
			end, "Type [D]efinition")
		end

		if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_declaration) then
			map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
			map("<leader>gD", function()
				require("mini.extra").pickers.lsp({ scope = "declaration" })
			end, "[G]oto [D]eclaration")
		end

		if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
			map("<leader>th", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
			end, "[T]oggle Inlay [H]ints")
		end

		if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
			local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })

			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.clear_references,
			})

			vim.api.nvim_create_autocmd("LspDetach", {
				group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
				callback = function(detach_event)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = detach_event.buf })
				end,
			})
		end
	end,
})
