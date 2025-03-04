local colors = {
	bg = "#1f1f1f",
	bg_highlight = "#333333",
	fg = "#cccccc",
	comment = "#43AA8B",
	string = "#FFA400",
	special = "#FFA400",
	keyword = "#B4ADEA",
	bracket = "#fec601",
	type = "#E44D78",
	constant = "#ECCFE8",
	function_name = "#7D59FF",
	variable = "#E6E8E2",
	namespace = "#B5C2B7",
	error = "#F44747",
	warning = "#49B6FF",
	hint = "#49B6FF",
	info = "#49B6FF",
	success = "#6eeb83",
	generic_type_parameter = "#5dd9c1",
}

local highlights = {
	{ "Normal",                { fg = colors.fg, bg = colors.bg } },
	{ "Comment",               { fg = colors.comment, italic = true } },
	{ "String",                { fg = colors.string } },
	{ "Special",               { fg = colors.special } },
	{ "Delimiter",             { fg = colors.bracket } },
	{ "Keyword",               { fg = colors.keyword } },
	{ "Type",                  { fg = colors.type } },
	{ "Constant",              { fg = colors.constant } },
	{ "Function",              { fg = colors.function_name } },
	{ "Variable",              { fg = colors.variable } },
	{ "Identifier",            { fg = colors.variable } },
	{ "Namespace",             { fg = colors.namespace } },
	{ "Error",                 { fg = colors.error, bold = true } },
	{ "Warning",               { fg = colors.warning } },
	{ "Hint",                  { fg = colors.hint } },
	{ "Info",                  { fg = colors.info } },
	{ "DiagnosticUnnecessary", { fg = colors.info } },
	{ "DiagnosticWarn",        { fg = colors.info } },
	{ "DiagnosticError",       { fg = colors.error } },
	{ "@comment.warning",      { fg = colors.info } },
	{ "@comment.error",        { fg = colors.error } },
	{ "@diff.plus",            { fg = colors.success } },
	{ "@diff.minus",           { fg = colors.error } },
	{ "@diff.delta",           { fg = colors.info } },
	-- Dap
	{
		"DapStopped",
		{ bg = colors.bg_highlight },
	},
	{
		"DapLogPoint",
		{ bg = colors.bg_highlight },
	},
	{
		"DapBreakpointCondition",
		{ bg = colors.bg_highlight },
	},
	{
		"DapBreakpoint",
		{ bg = colors.bg_highlight },
	},
	-- Golang
	{ "@type.builtin.go",          { fg = colors.generic_type_parameter } },
	{ "@punctuation.bracket.go",   { fg = colors.bracket } },
	{ "@constant.builtin.go",      { fg = colors.keyword } },
	{ "@function.builtin.go",      { fg = colors.function_name } },
	{ "@module.go",                { fg = colors.namespace, bold = true } },
	{ "@property.go",              { fg = colors.variable } },
	-- Bash
	{ "@function.builtin.bash",    { fg = colors.function_name } },
	{ "@punctuation.special.bash", { fg = colors.function_name } },
	-- Neo tree
	{ "NeoTreeDirectoryIcon",      { fg = colors.type } },
	{ "NeoTreeGitUntracked",       { fg = colors.info } },
	{ "NeoTreeDirectoryName",      { fg = colors.keyword } },
	{ "NeoTreeRootName",           { fg = colors.keyword, bold = true } },
	-- C
	{ "@type.builtin.c",           { fg = colors.generic_type_parameter } },
	-- Lua
	{ "@constructor.lua",          { fg = colors.bracket } },
}

for _, hl in ipairs(highlights) do
	vim.api.nvim_set_hl(0, hl[1], hl[2])
end

vim.fn.sign_define("DapBreakpoint", { text = "B", texthl = "Error", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "C", texthl = "Error", linehl = "", numhl = "" })
vim.fn.sign_define("DapLogPoint", { text = "L", texthl = "Error", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "→", texthl = "Info", linehl = "DapStopped", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = "R", texthl = "Error", linehl = "", numhl = "" })
