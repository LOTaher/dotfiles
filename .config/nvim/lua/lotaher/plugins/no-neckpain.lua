return {
	"shortcuts/no-neck-pain.nvim",
	config = function()
		vim.keymap.set("n", "<leader>nn", ":NoNeckPain<CR>")
	end,
}
