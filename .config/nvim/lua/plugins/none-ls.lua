return {
	{
		"jay-babu/mason-null-ls.nvim",
		lazy = false,
		config = function()
			require("mason-null-ls").setup({
				ensure_installed = {
					"stylua",
					"prettier",
					"goimports",
					"shfmt",
				},
				automatic_installation = true,
			})
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.prettier,
					null_ls.builtins.formatting.goimports,
					null_ls.builtins.formatting.shfmt,
				},
			})
		end,
	},
}
