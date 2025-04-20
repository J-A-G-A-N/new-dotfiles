return{
	{
		'zdszero/vimwiki-markdown',
	},
	{
	'MeanderingProgrammer/render-markdown.nvim'	,
		lazy = false,
		config = function ()
		local markdown =  require("render-markdown")
		markdown.setup({
			render_modes = {'n','c','t'},
			latex = {
        -- Whether LaTeX should be rendered, mainly used for health check
        enabled = true,
        -- Executable used to convert latex formula to rendered unicode
        converter = 'latex2text',
        -- Highlight for LaTeX blocks
        highlight = 'RenderMarkdownMath',
        -- Amount of empty lines above LaTeX blocks
        top_pad = 0,
        -- Amount of empty lines below LaTeX blocks
        bottom_pad = 0,
			},
		})
	end
	},
	{
    "iamcco/markdown-preview.nvim",
		lazy = false,
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
    config = function()
      -- Optional configuration settings
      vim.g.mkdp_auto_start = 0  -- Don't auto-start preview
      vim.g.mkdp_auto_close = 1  -- Auto close preview when changing buffer
      vim.g.mkdp_refresh_slow = 0  -- Refresh on save or leave insert mode
      vim.g.mkdp_command_for_global = 0  -- Command available for all files
      vim.g.mkdp_browser = ""  -- Default browser for preview
    end,
  },
	{
			"tjdevries/present.nvim",
			config = function ()
			local present = require("present")
			end
	}
}
