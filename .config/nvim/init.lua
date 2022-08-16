require("plugins")

local maps = require("maps")
require("configs")
require("mason").setup()
require("indent_blankline").setup({
	-- for example, context is off by default, use this to turn it on
	show_current_context = true,
	show_current_context_start = true,
})

-- require("flutter-tools").setup({}) -- use defaults
-- require("telescope").load_extension("flutter")

local plugins = {
	"lsp-saga",
	-- "null-ls",
	"nvim-tree",
	-- "diff-view",
	"coq",
	"comment",
	"gitsigns",
	"lspfuzzy",
	"gitblame",
	"nvim-treesitter",
	"spellsitter",
	"cursorline",
	"lualine",
	"bufferline",
	"auto-save",
	"material-colorscheme",
	"telescope",
	-- "cmp",
	-- "trouble",
}
local plugins_dir = "plugins"
local imported_plugins = {}

for _, v in ipairs(plugins) do
	local p = plugins_dir .. "/" .. v .. "-config"
	imported_plugins[v] = require(p)
end

local lsp_flags = {
	debounce_text_changes = 150,
}

local servers = { "pyright", "tsserver", "sumneko_lua", "marksman", "dartls" }

-- local capabilities = imported_plugins["cmp"]
--
-- for _, value in ipairs(servers) do
-- 	require("lspconfig")[value].setup({
-- 		on_attach = maps.on_attach,
-- 		flags = lsp_flags,
-- 		capabilities = capabilities,
-- 	})
-- end

local coq = require("coq")

for _, value in ipairs(servers) do
	require("lspconfig")[value].setup(coq.lsp_ensure_capabilities({
		on_attach = maps.on_attach,
		flags = lsp_flags,
	}))
end
vim.cmd("COQnow -s")
