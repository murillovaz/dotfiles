return {

	{
		"kyoh86/vim-go-coverage",
		config = function()
			vim.keymap.set("n", "<leader>co", ":GoCover<CR>")
			vim.keymap.set("n", "<leader>cc", ":GoCoverClear<CR>")
		end,
	},
}
