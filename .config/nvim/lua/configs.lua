---@diagnostic disable: undefined-global
vim.g.mapleader = " "
vim.api.nvim_set_keymap("i", "jk", "<ESC>", { noremap = true })
vim.api.nvim_set_keymap("i", "kj", "<ESC>", { noremap = true })
vim.api.nvim_set_keymap("n", "<TAB>", ":BufferLineCycleNext<cr>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<S-TAB>", ":BufferLineCyclePrev<cr>", { noremap = true, silent = true })

local nt_api = require("nvim-tree.api")
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader><leader>", require("telescope.builtin").find_files, opts)
vim.keymap.set("n", "<leader>b", require("telescope.builtin").buffers, opts)
vim.keymap.set("n", "<leader>/", nt_api.tree.toggle, opts)
vim.keymap.set("n", "<leader>gg", "<cmd>DiffviewOpen<cr>", opts)
vim.keymap.set("n", "<leader>gc", "<cmd>DiffviewClose<cr>", opts)
vim.keymap.set("n", "<A-t>", "<cmd>Lspsaga open_floaterm<cr>", opts)
vim.keymap.set("t", "<A-t>", "<cmd>Lspsaga close_floaterm<cr>", opts)
vim.keymap.set("n", "<leader>f", "<cmd>Neoformat<cr>", opts)

-- options
vim.o.relativenumber = true

vim.g.coq_settings = {
	auto_start = "shut-up",
}
vim.g.material_style = "oceanic"

vim.cmd([[ colorscheme material ]])
vim.opt.swapfile = false
vim.opt.signcolumn = "yes"

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
require("functions/diagnostics-sign")(signs)

vim.diagnostic.config({
	virtual_text = false, --enable it to display inline warning texts
	signs = true,
	underline = true,
	severity_sort = false,
	update_in_insert = false,
})

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.api.nvim_create_autocmd("CursorHold", {
	-- buffer = bufnr,
	callback = function()
		local opts = {
			focusable = false,
			close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
			border = "rounded",
			source = "always",
			prefix = " ",
			scope = "cursor",
		}
		vim.diagnostic.open_float(nil, opts)
	end,
})
