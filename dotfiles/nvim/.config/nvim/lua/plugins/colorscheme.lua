return {
	{
		"ellisonleao/gruvbox.nvim",
		name = "gruvbox",
		priority = 1000 , 
		config = function ()
			require("gruvbox").setup({
			})	
			vim.background = "dark"
		vim.cmd.colorscheme "gruvbox"
		end

	},

	-- 	{
	-- 	"catppuccin/nvim", name = "catppuccin", priority = 1000 ,
	-- 	config = function()
	-- 	require("catppuccin").setup({
	-- 		flavour = "macchiato", -- latte, frappe, macchiato, mocha ,auto
	-- 		background = { -- :h background
	-- 			light = "latte",
	-- 		},
	-- 		transparent_background = true, -- disables setting the background color.
	-- 		show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
	-- 		term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
	-- 		dim_inactive = {
	-- 			enabled = false, -- dims the background color of inactive window
	-- 			shade = "light",
	-- 			percentage = 0.15, -- percentage of the shade to apply to the inactive window
	-- 		},
	-- 		color_overrides = {},
	-- 		custom_highlights = {},
	-- 		default_integrations = true,
	-- 		integrations = {
	-- 			cmp = true,
	-- 			gitsigns = true,
	-- 			nvimtree = true,
	-- 			treesitter = true,
	-- 			notify = true,
	-- 			mini = {
	-- 				enabled = true,
	-- 				indentscope_color = "",
	-- 			},
	-- 		},
	-- })
	-- -- setup must be called before loading
	-- 		end
	-- }
}
