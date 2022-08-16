-- local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

local diagnostic_signs = function(signs)
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end
end

return diagnostic_signs
