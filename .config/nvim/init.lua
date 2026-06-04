-- Options

vim.g.mapleader = " "
vim.g.termguicolors = true

vim.o.nu = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.scrolloff = 10
vim.o.colorcolumn = "100"
vim.o.winborder = "rounded"

vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- Maps

local map = vim.keymap.set

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

map("n", "<S-Right>", ":vertical resize -2<CR>")
map("n", "<S-Left>", ":vertical resize +2<CR>")
map("n", "<S-Up>", ":resize +2<CR>")
map("n", "<S-Down>", ":resize -2<CR>")

map("n", "<leader>|", "<Cmd>vsplit<CR>")
map("n", "<leader>_", "<Cmd>split<CR>")

map("n", "J", "mzJ`z")

map("n", "d", '"_d')
map("v", "d", '"_d')

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

map("n", "<C-a>", "ggVG")

map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("v", "<S-Tab>", "<gv")
map("v", "<Tab>", ">gv")

map("n", "<leader>t", ":below te<CR>i")
map("t", "<Esc>", "<C-\\><C-n>")

map("n", "<A-j>", ":cnext<CR>")
map("n", "<A-k>", ":cprev<CR>")

map("n", "<leader>tn", ":tabnew<CR>")
map("n", "<S-l>", ":tabnext<CR>")
map("n", "<S-h>", ":tabprevious<CR>")

-- Autocommands

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		vim.cmd("silent! %s/\\s\\+$//e")
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local opts = { buffer = ev.buf }
		map("n", "gd", vim.lsp.buf.definition, opts)
		map("n", "<leader>k", vim.lsp.buf.hover, opts)
		map("n", "<leader>s", vim.lsp.buf.rename, opts)
		map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
		map("n", "<leader>gr", vim.lsp.buf.references, opts)
		map("n", "<leader>vd", vim.diagnostic.open_float, opts)
		map("n", "]d", function()
			vim.diagnostic.jump({ count = 1 })
			vim.schedule(vim.diagnostic.open_float)
		end, opts)
		map("n", "[d", function()
			vim.diagnostic.jump({ count = -1 })
			vim.schedule(vim.diagnostic.open_float)
		end, opts)
	end,
})

-- User Commands

vim.api.nvim_create_user_command("LspRestart", function()
	for _, client in ipairs(vim.lsp.get_clients()) do
		client:stop()
	end
	vim.cmd("edit")
end, {})

-- Plugins

vim.pack.add({
	{ src = "https://github.com/ellisonleao/gruvbox.nvim" },
	{ src = "https://github.com/hrsh7th/nvim-cmp" },
	{ src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
	{ src = "https://github.com/hrsh7th/cmp-path" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/romus204/tree-sitter-manager.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/tpope/vim-fugitive" },
	{ src = "https://github.com/mbbill/undotree" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/windwp/nvim-autopairs" },
})

require("gruvbox").setup({
	italic = {
		strings = false,
	},
})
require("tree-sitter-manager").setup({
	ensure_installed = { "typescript", "lua", "go", "zig", "odin", "prisma" },
	languages = {
		prisma = {
			install_info = {
				url = "https://github.com/victorhqc/tree-sitter-prisma",
			},
		},
	},
})
require("nvim-autopairs").setup()
require("cmp").setup({
	sources = {
		{ name = "nvim_lsp" },
		{ name = "path" },
	},
	mapping = require("cmp").mapping.preset.insert({
		["<C-n>"] = require("cmp").mapping.select_next_item(),
		["<C-p>"] = require("cmp").mapping.select_prev_item(),
		["<C-b>"] = require("cmp").mapping.scroll_docs(-4),
		["<C-f>"] = require("cmp").mapping.scroll_docs(4),
		["<C-y>"] = require("cmp").mapping.confirm({ select = true }),
		["<C-Space>"] = require("cmp").mapping.complete({}),
	}),
})
require("mason").setup()
require("gitsigns").setup()
require("mini.pick").setup({
	window = {
		config = function()
			local width = math.floor(vim.o.columns * 0.6)
			local height = math.floor(vim.o.lines * 0.4)
			local row = math.floor((vim.o.lines - height) / 2) - 1
			local col = math.floor((vim.o.columns - width) / 2)

			return {
				anchor = "NW",
				border = "rounded",
				relative = "editor",
				row = row,
				col = col,
				width = width,
				height = height,
			}
		end,
	},
	mappings = {
		send_to_qflist = {
			char = "<C-q>",
			func = function()
				local picker = require("mini.pick")
				local qflist = {}
				local matches = picker.get_picker_matches().all

				for _, match in ipairs(matches) do
					if type(match) == "table" then
						table.insert(qflist, match)
					else
						local path, lnum, col, search = string.match(match, "(.-)%z(%d+)%z(%d+)%z%s*(.+)")
						local text = path and string.format("%s [%s:%s]  %s", path, lnum, col, search)
						local filename = path or vim.trim(match):match("%s+(.+)")

						table.insert(qflist, {
							filename = filename or match,
							lnum = lnum or 1,
							col = col or 1,
							text = text or match,
						})
					end
				end

				vim.fn.setqflist(qflist, "r")
				vim.cmd("copen")
			end,
		},
	},
})
require("oil").setup({
	view_options = {
		show_hidden = true,
	},
})
require("conform").setup({
	formatters_by_ft = {
		go = { "gofmt", "goimports" },
		javascript = { "prettierd" },
		typescript = { "prettierd" },
		svelte = { "prettierd" },
		json = { "prettierd" },
		yaml = { "prettierd" },
		markdown = { "prettierd" },
		css = { "prettierd" },
		html = { "prettierd" },
		lua = { "stylua" },
		terraform = { "terraform_fmt" },
	},
	format_on_save = function(bufnr)
		if vim.bo[bufnr].filetype == "c" or vim.bo[bufnr].filetype == "cpp" then
			return nil
		end
		return { timeout_ms = 500, lsp_format = "fallback" }
	end,
})

require("jumpy").setup({
	provider = "anthropic",
})

vim.lsp.enable({
	"lua_ls",
	"clangd",
	"gopls",
	"ts_ls",
	"dockerls",
	"prismals",
	"html-lsp",
	"sqlls",
	"zls",
	"ols",
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
		},
	},
})

vim.lsp.config("gopls", {
	settings = {
		gopls = {
			completeUnimported = true,
			usePlaceholders = true,
			matcher = "fuzzy",
			staticcheck = true,
			analyses = {
				unusedparams = true,
			},
		},
	},
})

vim.diagnostic.config({
	severity_sort = true,
	float = { border = "rounded", source = "if_many" },
	underline = { severity = vim.diagnostic.severity.ERROR },
})

vim.cmd.colorscheme("gruvbox")

-- Plugin maps

map("n", "<leader>gb", ":Gitsigns blame_line<CR>")
map("n", "<leader>gB", ":Gitsigns blame<CR>")

map("n", "<leader>ff", ":Pick files<CR>")
map("n", "<leader>fh", ":Pick help<CR>")
map("n", "<leader>fw", ":Pick grep_live<CR>")
map("n", "<leader>fg", ":Pick files tool='git'<CR>")

map("n", "<leader>pv", ":Oil<CR>")

map("n", "<leader>gs", vim.cmd.Git)
map("n", "<leader>u", vim.cmd.UndotreeToggle)
