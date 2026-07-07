return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			{ "fredrikaverpil/neotest-golang", version = "*" },
			"nvim-neotest/neotest-python",
			"nvim-neotest/neotest-jest",
			"marilari88/neotest-vitest",
		},
		config = function()
			-- Route JS/TS test files to exactly one runner: vitest if a vitest
			-- config exists up the tree from the file, otherwise jest -- so the
			-- two adapters never both claim (double-run) the same file.
			local function is_jsts_test(file_path)
				return file_path:match("%.test%.[jt]sx?$") ~= nil or file_path:match("%.spec%.[jt]sx?$") ~= nil
			end
			local function uses_vitest(file_path)
				return vim.fs.root(file_path, {
					"vitest.config.ts",
					"vitest.config.js",
					"vitest.config.mjs",
					"vitest.config.mts",
					"vitest.workspace.ts",
				}) ~= nil
			end

			require("neotest").setup({
				adapters = {
					require("neotest-golang")({}), -- Go
					require("neotest-python")({ dap = { justMyCode = false } }), -- Python (pytest/unittest)
					require("neotest-vitest")({
						is_test_file = function(file_path)
							return is_jsts_test(file_path) and uses_vitest(file_path)
						end,
					}), -- JS/TS via Vitest (only in vitest projects)
					require("neotest-jest")({
						is_test_file = function(file_path)
							return is_jsts_test(file_path) and not uses_vitest(file_path)
						end,
					}), -- JS/TS via Jest (only when no vitest config)
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
