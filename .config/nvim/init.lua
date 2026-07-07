-- require("themes.notnull")
local uv = vim.uv or vim.loop -- vim.loop is deprecated in Nvim 0.12
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not uv.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("lazy").setup("plugins")
require("themes.base16_override").override_base16()
-- vim.cmd("colorscheme base16-black-metal-khold")
