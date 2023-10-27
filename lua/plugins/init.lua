require("lazy").setup({
    -- TELESCOPE
	{
		"nvim-telescope/telescope.nvim",
		lazy = false,
		tag = "0.1.3",
		dependencies = { { "nvim-lua/plenary.nvim" } },
		config = function()
			return require("plugins.configs.telescope")
		end,
	},

    -- CATPUCCIN
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		config = function()
			return require("plugins.configs.catppuccin")
		end,
	},

    -- LIGHTLINE
	{
		"itchyny/lightline.vim",
		lazy = false,
		config = function()
			vim.g.lightline = { colorscheme = "catppuccin" }
			vim.g.airline_theme = "catppuccin"
		end,
	},

	-- DEVICONS
	{
		"kyazdani42/nvim-tree.lua",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		config = function()
			return require("plugins.configs.nvimtree")
		end,
	},

    -- TREESITTER
    {
		"nvim-treesitter/nvim-treesitter",
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		build = ":TSUpdate",
		config = function()
			return require("plugins.configs.treesitter")
		end,
	},

    -- AUTOTAG and AUTOPAIRS
    { "windwp/nvim-ts-autotag" },
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},

    -- UNDOTREE
    {
		"mbbill/undotree",

		config = function()
			return require("plugins.configs.undotree")
		end,
	},

    -- LSP
    {
		"VonHeikemen/lsp-zero.nvim",
		lazy = false,
		branch = "v3.x",
		config = function()
			return require("plugins.configs.lsp")
		end,
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{
				"hrsh7th/nvim-cmp",
				config = function()
					return require("plugins.configs.cmp")
				end,
			},
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },
			{
				"roobert/tailwindcss-colorizer-cmp.nvim",
				config = function()
					require("tailwindcss-colorizer-cmp").setup({
						color_square_width = 2,
					})
				end,
			},

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	},

    -- NVIMTREE
    {
		"kyazdani42/nvim-tree.lua",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		config = function()
			return require("plugins.configs.nvimtree")
		end,
	},

    -- ALE
    {
		"dense-analysis/ale",
		config = function()
			return require("plugins.configs.ale")
		end,
	},
})