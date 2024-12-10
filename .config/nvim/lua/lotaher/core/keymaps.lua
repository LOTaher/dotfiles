vim.g.mapleader = " "

-- Disabling since I now use neo-tree
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move full lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Vim keys to switch between buffers
-- vim.keymap.set("n", "<C-h>", "<C-w>h")
-- vim.keymap.set("n", "<C-j>", "<C-w>j")
-- vim.keymap.set("n", "<C-k>", "<C-w>k")
-- vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Buffer resizing
vim.keymap.set("n", "<S-Left>", "<Cmd>vertical resize -2<CR>")
vim.keymap.set("n", "<S-Right>", "<Cmd>vertical resize +2<CR>")
vim.keymap.set("n", "<S-Up>", "<Cmd>resize -2<CR>")
vim.keymap.set("n", "<S-Down>", "<Cmd>resize +2<CR>")

-- Vertical split
vim.keymap.set("n", "<leader>|", "<Cmd>vsplit<CR>")
-- Horizontal split
vim.keymap.set("n", "<leader>_", "<Cmd>split<CR>")

-- Takes line below you and appends it with a space
vim.keymap.set("n", "J", "mzJ`z")

-- Keep cursor in the middle when <C-d> & <C-u>ing
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Select all
vim.keymap.set("n", "<C-a>", "ggVG")

-- When searching, keep the cursor in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Smart paste (the thing you paste over gets lost in the void)
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Smart delete (the thing you delete gets lost in the void)
vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

--tabs in visual mode
vim.keymap.set("v", "<S-Tab>", "<<")
vim.keymap.set("v", "<Tab>", ">>")

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

--allows ci without removing current paste buffer
vim.keymap.set("n", "ci(", '"_ci(')
vim.keymap.set("n", "ci)", '"_ci)')
vim.keymap.set("n", "ci{", '"_ci{')
vim.keymap.set("n", "ci}", '"_ci}')
vim.keymap.set("n", "ci'", "\"_ci'")
vim.keymap.set("n", "ci[", '"_ci[')
vim.keymap.set("n", "ci]", '"_ci]')
vim.keymap.set("n", 'ci"', '"_ci"')

-- Allow the use of D without copying
vim.keymap.set("n", "d", '"_d')
vim.keymap.set("v", "d", '"_d')

-- Use :InspectTree
vim.keymap.set("n", "<leader>i", vim.cmd.InspectTree)

-- Plenary tests
vim.keymap.set("n", "<leader>t", "<Plug>PlenaryTestFile")

-- Source the current file
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>")
-- Source the current line of cursor
vim.keymap.set("n", "<leader>x", ":.lua<CR>")
-- Source the highlighted block
vim.keymap.set("v", "<leader>x", ":lua<CR>")

-- Mass replace the word your cursor is on
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader><leader>", ":so<CR>")
