-- Python debugging through nvim-dap (uses your existing dap keymaps: F5,
-- <leader>b, etc.). dap-python picks up the debuggee interpreter from your
-- active virtualenv automatically; the adapter itself runs from mason's debugpy.
return {
	"mfussenegger/nvim-dap-python",
	ft = "python",
	dependencies = { "mfussenegger/nvim-dap" },
	config = function()
		local debugpy = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
		if vim.fn.executable(debugpy) == 0 then
			debugpy = "python3" -- fallback until mason installs debugpy
		end
		require("dap-python").setup(debugpy)
	end,
}
