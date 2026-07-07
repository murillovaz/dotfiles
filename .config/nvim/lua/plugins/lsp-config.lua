-- Neovim 0.12 LSP setup.
-- Servers are configured via the built-in `vim.lsp.config` / `vim.lsp.enable`
-- API (nvim-lspconfig only ships the per-server `lsp/*.lua` definitions now;
-- `require("lspconfig").xxx.setup{}` is deprecated). mason-lspconfig v2 installs
-- the servers and, with `automatic_enable`, calls `vim.lsp.enable` for us.
return {
	{
		"mason-org/mason.nvim", -- moved from williamboman/mason.nvim
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim", -- v2
		lazy = false,
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"ts_ls",
					"html",
					"lua_ls",
					"pyright",
					"biome",
					"gopls",
					"clangd",
				},
				-- v2: auto-enables installed servers via vim.lsp.enable().
				-- (replaces the removed `automatic_installation` option)
				automatic_enable = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			-- Per-server overrides go here, e.g.:
			-- vim.lsp.config("gopls", { settings = { gopls = {} } })
			--
			-- clangd is left to mason-lspconfig's automatic_enable. It used to be
			-- disabled here due to a proto-file bug; re-check on 0.12 and, if it
			-- still misbehaves, exclude it in mason-lspconfig's `automatic_enable`.

			-- LSP keymaps, set per-buffer when a server attaches.
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local bufnr = args.buf
					local function map(mode, lhs, rhs)
						vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true })
					end

					-- Formatting is handled by conform.nvim (<leader>f), which
					-- falls back to vim.lsp.buf.format when no formatter is set.
					map("n", "K", vim.lsp.buf.hover)
					map("n", "<leader>gd", vim.lsp.buf.definition)
					map("n", "<leader>gi", vim.lsp.buf.implementation)
					map("n", "<leader>gr", vim.lsp.buf.references)
					map("n", "<leader>rn", vim.lsp.buf.rename)
					map("n", "<leader>ca", vim.lsp.buf.code_action)

					-- Native LSP completion (0.11+). autotrigger=false keeps it
					-- manual; press <C-.> to request completions.
					local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
					if client:supports_method("textDocument/completion") then
						vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = false })
					end
				end,
			})

			-- Popup-menu navigation for the native completion menu.
			local pumMaps = {
				["<Tab>"] = "<C-n>",
				["<S-Tab>"] = "<C-p>",
				["<Down>"] = "<C-n>",
				["<Up>"] = "<C-p>",
				["<CR>"] = "<C-y>",
			}
			for insertKmap, pumKmap in pairs(pumMaps) do
				vim.keymap.set("i", insertKmap, function()
					return vim.fn.pumvisible() == 1 and pumKmap or insertKmap
				end, { expr = true })
			end
			vim.keymap.set("i", "<C-.>", vim.lsp.completion.get, { noremap = true, silent = true })

			vim.o.completeopt = "menu,noinsert,popup,fuzzy"
			vim.o.winborder = "rounded"

			-- To switch to fully-native, no-keymap autocompletion on 0.12 instead,
			-- drop the <C-.>/autotrigger bits above and set: vim.o.autocomplete = true

			vim.diagnostic.config({
				virtual_lines = true,
			})
		end,
	},
}
