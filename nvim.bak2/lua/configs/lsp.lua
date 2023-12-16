local lsp_zero = require("lsp-zero")

local null_ls = require("null-ls")

local builtins = null_ls.builtins

local null_ls_sources = {
	builtins.formatting.stylua,
	builtins.diagnostics.golangci_lint,
	builtins.formatting.eslint_d,
}

lsp_zero.extend_lspconfig()

lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({
		buffer = bufnr,
		preserve_mappings = false,
	})
end)

lsp_zero.format_on_save({
	format_opts = {
		async = true,
		timeout_ms = 10000,
	},
	servers = {
		["gopls"] = { "go" },
	},
})

require("mason").setup({})
require("mason-lspconfig").setup({
	handlers = {
		lsp_zero.default_setup,
		lua_ls = function()
			-- (Optional) Configure lua language server for neovim
			local lua_opts = lsp_zero.nvim_lua_ls()
			require("lspconfig").lua_ls.setup(lua_opts)
		end,
	},
	automatic_installation = true,
})

lsp_zero.setup_servers({ "lua_ls", "gopls", "tailwindcss", "tsserver" })

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
	-- you can reuse a shared lspconfig on_attach callback here
	sources = null_ls_sources,
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					-- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
					vim.lsp.buf.format({ async = false, bufnr = bufnr })
				end,
			})
		end

		if client.name == "eslint_d" then
			client.server_capabilities.documentFormattingProvider = true
		elseif client.name == "eslint" then
			client.server_capabilities.documentFormattingProvider = true
		elseif client.name == "tsserver" then
			client.server_capabilities.documentFormattingProvider = false
		end
	end,
})
