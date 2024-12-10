return {
	"ellisonleao/gruvbox.nvim", -- theme
	priority = 1000,
	config = function()
		require("gruvbox").setup({
			contrast = "hard",
			palette_overrides = { dark0_hard = "#0E1018" },
			overrides = {
				StatusLine = { bg = "#ffffff", fg = "#0E1018" },
				StatusLineNC = { bg = "#3c3836", fg = "#0E1018" },
				CursorLineNr = { fg = "#fabd2f", bg = "" },
				GruvboxOrangeSign = { fg = "#dfaf87", bg = "" },
				GruvboxAquaSign = { fg = "#8EC07C", bg = "" },
				GruvboxGreenSign = { fg = "#b8bb26", bg = "" },
				GruvboxRedSign = { fg = "#fb4934", bg = "" },
				GruvboxBlueSign = { fg = "#83a598", bg = "" },
				WilderMenu = { fg = "#ebdbb2", bg = "" },
				WilderAccent = { fg = "#f4468f", bg = "" },
			},
		})
		vim.cmd.colorscheme("gruvbox")
	end,
}
