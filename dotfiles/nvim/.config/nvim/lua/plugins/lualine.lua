return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require('lualine').setup({
      options = {
        theme = 'gruvbox',-- Dynamically set theme to the current colorscheme
				
      },
		})
  end
}


