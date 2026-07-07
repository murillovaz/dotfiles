return {
	{
		"mfussenegger/nvim-dap",
		lazy = false,
		config = function()
			local dap = require("dap")
			-- Keybindings for debugging
			vim.keymap.set("n", "<leader>dc", dap.run_to_cursor)
			vim.keymap.set("n", "<F5>", require("dap").continue, {})
			vim.keymap.set("n", "<F10>", require("dap").step_over, {})
			vim.keymap.set("n", "<F11>", require("dap").step_into, {})
			vim.keymap.set("n", "<F12>", require("dap").step_out, {})
			vim.keymap.set("n", "<leader>b", require("dap").toggle_breakpoint, {})
			vim.keymap.set("n", "<leader>dr", require("dap").repl.open, {})
		end,
	},
	{
		"rcarriga/nvim-dap-ui", -- Install nvim-dap-ui
		lazy = false,
		dependencies = { "mfussenegger/nvim-dap" },
		config = function()
			local dapui = require("dapui")
			dapui.setup()

			-- Eval var under cursor
			vim.keymap.set("n", "<leader>dd", function()
				dapui.eval(nil, { enter = true })
			end)

			vim.keymap.set("n", "<leader>tu", function()
				vim.cmd.Neotree("close")
				dapui.toggle()
			end, { noremap = true, silent = true })
		end,
	},
	{
		"leoluz/nvim-dap-go",
		lazy = false,
		config = function()
			require("dap-go").setup()
		end,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		dependencies = { "mfussenegger/nvim-dap" },
		config = function()
			require("nvim-dap-virtual-text").setup({
				display_callback = function(variable)
					if #variable.value > 30 then
						return " " .. string.sub(variable.value, 1, 15) .. "... "
					end

					return " " .. variable.value
				end,
			})
		end,
	},
}
