-- Seamless navigation between nvim splits and tmux panes with <C-hjkl>.
-- Pairs with the vim-tmux-navigator snippet in ~/.config/tmux/tmux.conf.
return {
	"christoomey/vim-tmux-navigator",
	cmd = {
		"TmuxNavigateLeft",
		"TmuxNavigateDown",
		"TmuxNavigateUp",
		"TmuxNavigateRight",
		"TmuxNavigatePrevious",
		"TmuxNavigatorProcessList",
	},
	keys = {
		{ "<c-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Navigate left (nvim/tmux)" },
		{ "<c-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Navigate down (nvim/tmux)" },
		{ "<c-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Navigate up (nvim/tmux)" },
		{ "<c-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Navigate right (nvim/tmux)" },
		{ "<c-\\>", "<cmd>TmuxNavigatePrevious<cr>", desc = "Navigate to previous (nvim/tmux)" },
	},
}
