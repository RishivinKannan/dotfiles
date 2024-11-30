return {
    { "shaunsingh/nord.nvim" },
    {
        "projekt0n/github-nvim-theme",
        config = function()
            require("github-theme").setup({})
        end,
    },
    {
        "folke/tokyonight.nvim",
        lazy = true,
        opts = { style = "night" },
    },
}
