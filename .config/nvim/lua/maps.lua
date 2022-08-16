local M = {}

-- local saga_finder = require("lspsaga.finder")
-- local saga_code_action = require("lspsaga.codeaction")
local saga_hover = require("lspsaga.hover")
local saga_rename = require("lspsaga.rename")
local saga_signature_help = require("lspsaga.signaturehelp")
local saga_diagnostic = require("lspsaga.diagnostic")

M.on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	local disable_default_formatting_to_servers = { "tsserver", "sumneko_lua", "dartls" }

	for _, server in ipairs(disable_default_formatting_to_servers) do
		if client.name == server then
			client.resolved_capabilities.document_formatting = false
		end
	end

	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.formatting, bufopts)
	vim.keymap.set("n", "<leader>cd", saga_diagnostic.show_line_diagnostics, bufopts)
	vim.keymap.set("n", "gr", saga_rename.lsp_rename, bufopts)
	vim.keymap.set("n", "gs", saga_signature_help.signature_help, bufopts)
	vim.keymap.set("n", "gd", require("telescope.builtin").lsp_references, bufopts)
	vim.keymap.set("n", "K", saga_hover.render_hover_doc, bufopts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
end

return M
