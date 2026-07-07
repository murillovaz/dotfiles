return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master", -- pin: the `main` rewrite drops require("nvim-treesitter.configs").
		-- Nvim 0.12 enables treesitter highlighting by default for many filetypes;
		-- when ready, migrate this to the new `main`-branch setup and drop the pin.
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
