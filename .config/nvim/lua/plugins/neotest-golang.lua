return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			{ "fredrikaverpil/neotest-golang", version = "*" }, -- Installation
		},
		config = function()
			local neotest_golang_opts = {} -- Specify custom configuration
			require("neotest").setup({
				adapters = {
					require("neotest-golang")(neotest_golang_opts), -- Registration
				},
			})
		end,
		keys = {
			{
				"<leader>dn",
				function()
					require("neotest").run.run({ suite = false, strategy = "dap" })
				end,
				desc = "Test nearest test",
			},
			{
				"<leader>tn",
				function()
					require("neotest").output_panel.clear()
					require("neotest").run.run({})
				end,
				desc = "Test nearest test",
			},
			{
				"<leader>ta",
				function()
					require("neotest").output_panel.clear()
					require("neotest").run.run((vim.uv or vim.loop).cwd())
				end,
				desc = "Test all tests within project",
			},
			{
				"<leader>ts",
				function()
					require("neotest").summary.toggle()
				end,
				desc = "Open tests summary",
			},
			{
				"<leader>to",
				function()
					require("neotest").output_panel.toggle()
				end,
				desc = "Open test output window",
			},
			{
				"<leader>tc",
				function()
					require("neotest").output_panel.clear()
				end,
				desc = "Clear test output window",
			},
		},
	},
}
