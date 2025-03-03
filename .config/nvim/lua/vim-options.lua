--vim.cmd("set expandtab")
--vim.cmd("set tabstop=2")
--vim.cmd("set softtabstop=2")
--vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.g.background = "light"

vim.opt.swapfile = false

-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
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

