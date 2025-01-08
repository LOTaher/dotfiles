return {
	{
		"lotaher/capititle.nvim",
		config = function()
			vim.keymap.set("v", "<leader>t", vim.cmd.Capititle)
		end,
	},
	{
		"lotaher/rave.nvim",
	},
}
