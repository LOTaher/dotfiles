vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move full lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

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
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- Yank to clipboard instead
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Format
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Mass replace the word your cursor is on
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
