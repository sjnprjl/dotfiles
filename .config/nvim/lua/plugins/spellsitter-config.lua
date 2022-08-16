require("spellsitter").setup({
	enable = true,
	debug = false,
})

local my_augroup = vim.api.nvim_create_augroup("my_augroup", { clear = true })

vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "*",
	command = "setlocal nospell",
	group = my_augroup,
})
