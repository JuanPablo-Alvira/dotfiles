require("catppuccin").setup({
    flavour = "mocha",
	term_colors = false,
	dim_inactive = {
		enabled = false,
		shade = "dark",
		percentage = 0.4,
	},
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	integrations = {
		leap = true,
		cmp = true,
		treesitter = true,
		nvimtree = true,
		telescope = {
			enabled = true,
		},
	},
	color_overrides = {},
	highlight_overrides = {},
})

if vim.fn.has("termguicolors") == 1 then
	vim.opt.termguicolors = true
end

vim.cmd([[colorscheme catppuccin-macchiato]])

vim.g.lightline = { colorscheme = "catppuccin" }
vim.g.airline_theme = "catppuccin"
