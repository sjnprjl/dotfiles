local saga = require("lspsaga")

-- use default config
saga.init_lsp_saga({
	code_action_lightbulb = {
		enable = false,
	}
})
