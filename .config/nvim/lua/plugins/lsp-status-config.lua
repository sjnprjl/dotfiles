local lsp_status = require("lsp-status")
lsp_status.config({
	indicator_errors = "❌",
	indicator_warnings = "",
	indicator_info = "",
	indicator_hint = "?",
	indicator_ok = "✅",
	select_symbol = function(cursor_pos, symbol)
		if symbol.valueRange then
			local value_range = {
				["start"] = {
					character = 0,
					line = vim.fn.byte2line(symbol.valueRange[1]),
				},
				["end"] = {
					character = 0,
					line = vim.fn.byte2line(symbol.valueRange[2]),
				},
			}

			return require("lsp-status.util").in_range(cursor_pos, value_range)
		end
	end,
})
lsp_status.register_progress()

return lsp_status
