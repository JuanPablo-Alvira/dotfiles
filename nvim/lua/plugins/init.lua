require("lazy").setup({
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		config = function()
			return require("plugins.configs.catppuccin")
		end,
	},
    {
        "itchyny/lightline.vim",
		lazy = false,
		config = function()
			vim.g.lightline = { colorscheme = "catppuccin" }
			vim.g.airline_theme = "catppuccin"
		end,
    },

})
