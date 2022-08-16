local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

null_ls.setup({
	sources = {
		require("null-ls").builtins.formatting.stylua,
		require("null-ls").builtins.formatting.prettier.with({ extra_args = { "--single-quote" } }),
		require("null-ls").builtins.diagnostics.eslint,
		require("null-ls").builtins.completion.spell,
		require("null-ls").builtins.formatting.dart_format,
	},
})
