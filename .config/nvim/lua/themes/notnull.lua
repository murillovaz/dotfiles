local colors = {
	bg = "#1f1f1f",
	fg = "#cccccc",
	comment = "#43AA8B",
	string = "#FFA400",
	keyword = "#B4ADEA",
	bracket = "#FFA400",
	type = "#E44D78",
	constant = "#ECCFE8",
	function_name = "#7D59FF",
	variable = "#E6E8E2",
	namespace = "#B5C2B7",
	error = "#F44747",
	warning = "#CD9731",
	hint = "#B4ADEA",
	info = "#B4ADEA",
	generic_type_parameter = "#5dd9c1",
}

local highlights = {
	{ "Normal", { fg = colors.fg, bg = colors.bg } },
	{ "Comment", { fg = colors.comment, italic = true } },
	{ "String", { fg = colors.string } },
	{ "Keyword", { fg = colors.keyword } },
	{ "Type", { fg = colors.type } },
	{ "Constant", { fg = colors.constant } },
	{ "Function", { fg = colors.function_name } },
	{ "Variable", { fg = colors.variable } },
	{ "Namespace", { fg = colors.namespace } },
	{ "Error", { fg = colors.error, bold = true } },
	{ "Warning", { fg = colors.warning } },
	{ "Hint", { fg = colors.hint } },
	{ "Info", { fg = colors.info } },
	{ "@type.builtin.go", { fg = colors.generic_type_parameter } },
	{ "@punctuation.bracket.go", { fg = colors.bracket } },
	{ "@constant.builtin.go", { fg = colors.keyword } },
	{ "@function.builtin.go", { fg = colors.function_name } },
	{ "@module.go", { fg = colors.namespace, bold = true } },
	{ "@property.go", { fg = colors.variable } },
}

for _, hl in ipairs(highlights) do
	vim.api.nvim_set_hl(0, hl[1], hl[2])
end
