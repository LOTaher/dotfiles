return {
	{
		"stevearc/oil.nvim",
		config = function()
			require("oil").setup({
				keymaps = {
					["<C-h>"] = false,
					["<M-h>"] = "actions.select_split",
				},
				view_options = {
					show_hidden = true,
				},
			})

			-- Open parent directory in current window
			vim.keymap.set("n", "<leader>pv", "<CMD>Oil<CR>")
		end,
	},
}
