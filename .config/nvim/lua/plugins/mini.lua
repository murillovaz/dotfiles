return {
	"echasnovski/mini.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
	version = "*",
	config = function()
		local mini_ai = require("mini.ai")
		local spec_treesitter = mini_ai.gen_spec.treesitter
		mini_ai.setup({
			search_method = "cover",
			custom_textobjects = {
				F = spec_treesitter({ a = "@function.outer", i = "@function.inner" }),
				o = spec_treesitter({
					a = { "@conditional.outer", "@loop.outer", "@class.outer" },
					i = { "@conditional.inner", "@loop.inner", "@class.inner" },
				}),
				c = spec_treesitter({
					a = { "@class.outer" },
					i = { "@class.inner" },
				}),
				a = spec_treesitter({
					a = { "@parameter.outer" },
					i = { "@parameter.inner" },
				}),
			},
		})
		require("mini.surround").setup()
		require("mini.comment").setup()
	end,
}
