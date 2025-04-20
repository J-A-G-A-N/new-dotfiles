return {
   {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
  },
	{
		'saghen/blink.cmp',
		dependencies = 'rafamadriz/friendly-snippets',
		opts = {
			keymap = { preset = 'default' },
			appearance = {
				nerd_font_variant = 'mono',
			},
			completion = {
					accept = {
							auto_brackets = {enabled = true,},
					},
					ghost_text = {enabled = true},
					documentation = {auto_show = true,auto_show_delay_ms = 500},
			},
			signature = {enabled = true},
			sources = {
				default = { 'lsp', 'path', 'snippets', 'buffer', 'markdown','cmdline'},
            providers = {
                    markdown = {
                        name = 'RenderMardown',
                        module = 'render-markdown.integ.blink',
                        fallbacks = {'lsp'}
										},
            },
			 },
		},
		opts_extend = { "sources.default" },
		
},

	{
		'windwp/nvim-autopairs',
		config = function()
			local npairs = require("nvim-autopairs").setup({})
		end
}
}
