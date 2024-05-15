return {
    'numToStr/Comment.nvim',
    config = function()
        require("Comment").setup({
            block = 'gbc',
            opleader = {
                line = '<leader>c',
            },
        })
    end,
    lazy = false,
}
