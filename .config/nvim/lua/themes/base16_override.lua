local M = {}

M.override_base16 = function()
	local highlights = {
		-- Dap
		{
			"Comment",
			{ fg = vim.g.base16_gui03, bold = true, italic = true },
		},
		{
			"TSComment",
			{ fg = vim.g.base16_gui03, bold = true, italic = true },
		},
		{
			"DapStopped",
			{ bg = vim.g.base16_gui01 },
		},
		{
			"DapLogPoint",
			{ bg = vim.g.base16_gui01 },
		},
		{
			"DapBreakpointCondition",
			{ bg = vim.g.base16_gui01 },
		},
		{
			"DapBreakpoint",
			{ bg = vim.g.base16_gui01 },
		},
	}

	for _, hl in ipairs(highlights) do
		vim.api.nvim_set_hl(0, hl[1], hl[2])
	end

	vim.fn.sign_define("DapBreakpoint", { text = "B", texthl = "TSType", linehl = "", numhl = "" })
	vim.fn.sign_define("DapBreakpointCondition", { text = "C", texthl = "TSType", linehl = "", numhl = "" })
	vim.fn.sign_define("DapLogPoint", { text = "L", texthl = "Error", linehl = "", numhl = "" })
	vim.fn.sign_define("DapStopped", { text = "→", texthl = "Error", linehl = "DapStopped", numhl = "" })
	vim.fn.sign_define("DapBreakpointRejected", { text = "R", texthl = "Error", linehl = "", numhl = "" })
end

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = M.override_base16,
})

return M
