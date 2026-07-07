return {
	"Wansmer/treesj",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		local tree = require("treesj")
		tree.setup()
		vim.keymap.set("n", "<leader>m", tree.toggle)
	end,
}
