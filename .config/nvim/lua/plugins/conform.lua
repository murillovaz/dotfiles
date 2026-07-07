-- Formatting via conform.nvim (replaces none-ls + mason-null-ls).
-- Lazy-loads on save; formatters are the same set you had, still installed by mason.
return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>cf",
				function()
					require("conform").format({ async = true, lsp_format = "fallback", timeout_ms = 3000 })
				end,
				mode = { "n", "v" },
				desc = "Format buffer",
			},
		},
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "goimports" },
				python = { "ruff_organize_imports", "ruff_format" },
				sh = { "shfmt" },
				bash = { "shfmt" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				json = { "prettier" },
				jsonc = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				groovy = { "npm-groovy-lint" },
				kotlin = { "ktlint" }, -- Gradle-community standard (also formats *.gradle.kts)
			},
			-- Fall back to LSP formatting for filetypes with no formatter above.
			default_format_opts = { lsp_format = "fallback" },
		},
	},
	-- Keep mason auto-installing the formatter binaries (this was mason-null-ls's
	-- other job). mason-tool-installer is mason v2 compatible.
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "mason-org/mason.nvim" },
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"stylua",
					"prettier",
					"goimports",
					"shfmt",
					"clang-format",
					"npm-groovy-lint", -- Groovy format + CodeNarc lint
					"ktlint", -- Kotlin format (Gradle-community standard)
					"debugpy", -- Python DAP (nvim-dap-python)
					"js-debug-adapter", -- JS/TS DAP (vscode-js-debug)
					"java-debug-adapter", -- nvim-jdtls DAP bundle
					"java-test", -- nvim-jdtls test bundle
				},
			})
		end,
	},
}
