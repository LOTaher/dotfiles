vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.clipboard = "unnamedplus"

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 10

vim.opt.colorcolumn = "100"

vim.opt.foldenable = false

-- vim.opt.list = true
-- vim.opt.listchars = { eol = '↲' }

vim.cmd("set ve+=onemore")

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		vim.cmd("silent! %s/\\s\\+$//e")
	end,
})
