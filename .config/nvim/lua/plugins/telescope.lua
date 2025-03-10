return {
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>fa", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fg", function()
				builtin.live_grep({
					previewer = true,
					prompt_title = "Find in Files",
					cwd_only = true,
					initial_mode = "insert",
				})
			end, { noremap = true, silent = true })

			vim.keymap.set("n", "<leader>rf", function()
				builtin.oldfiles({
					previewer = true,
					prompt_title = "Recent Files",
					cwd_only = true,
					initial_mode = "normal",
				})
			end, { noremap = true, silent = true })

			require("telescope").load_extension("ui-select")
		end,
	},
}
