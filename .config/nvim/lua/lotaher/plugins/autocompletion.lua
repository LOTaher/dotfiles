return {
    {
        "windwp/nvim-ts-autotag"
    },
    {
        "windwp/nvim-autopairs",

        config = function()
            require("nvim-autopairs").setup({})
        end,
    }
}
