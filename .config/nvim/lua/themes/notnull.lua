local colors = {
    bg = "#1f1f1f",
    fg = "#cccccc",
    comment = "#43AA8B",
    string = "#FFA400",
    keyword = "#B4ADEA",
    type = "#E44D78",
    constant = "#ECCFE8",
    function_name = "#7D59FF",
    variable = "#E6E8E2",
    namespace = "#B5C2B7",
    error = "#F44747",
    warning = "#CD9731",
    hint = "#B4ADEA",
    info = "#B4ADEA",
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
}

for _, hl in ipairs(highlights) do
    vim.api.nvim_set_hl(0, hl[1], hl[2])
end

