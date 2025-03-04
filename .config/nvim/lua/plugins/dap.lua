return {
	{
		"mfussenegger/nvim-dap",
		lazy = false,
		config = function()
			local dap = require("dap")
			-- Keybindings for debugging
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

			-- Open UI automatically when debugging starts
			--	local dap = require("dap")
			--	dap.listeners.after.event_initialized["dapui_config"] = function()
			--		dapui.open()
			--		vim.cmd.Neotree("close")
			--	end
			--	dap.listeners.before.event_terminated["dapui_config"] = function()
			--		dapui.close()
			--	end
			--	dap.listeners.before.event_exited["dapui_config"] = function()
			--		dapui.close()
			--	end

			--	-- Keybinding to toggle DAP UI
			--			vim.keymap.set("n", "<leader>tu", dapui.toggle, {})
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
			require("nvim-dap-virtual-text").setup()
		end,
	},
}
