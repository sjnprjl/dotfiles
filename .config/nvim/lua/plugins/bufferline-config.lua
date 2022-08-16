vim.opt.termguicolors = true
require("bufferline").setup({
	options = {
		mode = "buffers",
		numbers = "ordinal",
		indicator_icon = "▎",
		buffer_close_icon = "",
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		tab_size = 15,
		diagnostics = "nvim_lsp",
		color_icons = true,
		separator_style = "slant",
		persist_buffer_sort = true,
		always_show_bufferline = true,
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			return "(" .. count .. ")"
		end,
		diagnostics_update_in_insert = false,
	},
})
