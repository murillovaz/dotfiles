--vim.cmd("set expandtab")
--vim.cmd("set tabstop=2")
--vim.cmd("set softtabstop=2")
--vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

vim.opt.swapfile = false

-- Quality-of-life defaults
vim.opt.updatetime = 250 -- snappier CursorHold / gitsigns / diagnostics
vim.opt.undofile = true -- persistent undo across sessions
vim.opt.signcolumn = "yes" -- always show sign column so text doesn't jitter
vim.opt.ignorecase = true -- case-insensitive search...
vim.opt.smartcase = true -- ...unless the query has a capital letter

-- Split/pane navigation (<C-hjkl>) is handled by vim-tmux-navigator
-- (see lua/plugins/tmux-navigator.lua) so it works seamlessly across
-- nvim splits and tmux panes.

vim.keymap.set("n", "<leader>nh", ":nohlsearch<CR>")
vim.wo.number = true
vim.wo.relativenumber = true

-- Rezise pane
vim.keymap.set("n", "<A-h>", ":vertical resize -2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-l>", ":vertical resize +2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-k>", ":resize +2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-j>", ":resize -2<CR>", { noremap = true, silent = true })

-- Exit terminal mode with Esc
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

-- Create terminal with :Tt and execute command
vim.api.nvim_create_user_command("Tt", function(opts)
	local height = math.floor(vim.o.lines * 0.3)
	vim.cmd("belowright split")
	vim.cmd("resize" .. height)
	vim.cmd("terminal")
	vim.cmd("startinsert")
	if opts.args ~= "" then
		vim.api.nvim_chan_send(vim.b.terminal_job_id, opts.args .. "\n")
	end
end, {
	nargs = "*",
	desc = "Open terminal and execute command",
})

vim.api.nvim_create_autocmd("BufWritePost", {
	callback = function()
		vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.ERROR, open = false })
	end,
	desc = "Update Quickfix list with errors on save",
})

vim.api.nvim_create_user_command("DiagnosticsQF", function()
	local qf_open = vim.fn.getqflist({ winid = 0 }).winid ~= 0

	if qf_open then
		vim.cmd("cclose")
	else
		local diagnostics = vim.diagnostic.get(nil, { severity = vim.diagnostic.severity.ERROR })

		if #diagnostics == 0 then
			vim.notify("No errors found!", vim.log.levels.INFO)
		else
			vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.ERROR })
		end
	end
end, { desc = "Toggle Quickfix list with errors" })

vim.keymap.set("n", "<leader>q", ":DiagnosticsQF<CR>", { desc = "Show all errors in quickfix" })

vim.keymap.set("n", "<leader>cl", function()
	vim.cmd("vsplit")
	vim.cmd("terminal claude")
	vim.cmd("startinsert")
end, { noremap = true, silent = true, desc = "Open Claude Code" })

vim.opt.timeoutlen = 750

vim.api.nvim_create_autocmd("FileType", {
	pattern = "qf",
	callback = function()
		local qf_list = vim.fn.getqflist()
		if #qf_list > 10 then
			vim.cmd("resize 10")
		else
			vim.cmd("resize 5")
		end
	end,
})
