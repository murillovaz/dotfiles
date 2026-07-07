-- Auto close & rename JSX / HTML / Angular-template tags (treesitter-based).
return {
	"windwp/nvim-ts-autotag",
	ft = {
		"html",
		"xml",
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"vue",
		"svelte",
		"markdown",
	},
	config = function()
		require("nvim-ts-autotag").setup()
	end,
}
