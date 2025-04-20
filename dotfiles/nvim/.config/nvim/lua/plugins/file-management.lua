return {
		{ {
				'nvim-telescope/telescope.nvim',
				tag = '0.1.6',
				dependencies = { 'nvim-lua/plenary.nvim' },

				config = function()
					local builtin = require("telescope.builtin")

					vim.keymap.set('n', '<C-t>', builtin.find_files, {})
					vim.keymap.set('n', '<leader>p', builtin.live_grep, {})
					vim.keymap.set('n', '<leader>h', builtin.help_tags,{})

					-- Key mapping to open another file in a vertical split screen using Telescope
					vim.api.nvim_set_keymap('n', '<leader>o',
						'<cmd>lua require("telescope.builtin").find_files({ layout_strategy = "vertical" })<CR>',
						{ noremap = true, silent = true })
				end
			},
			{
				"nvim-telescope/telescope-ui-select.nvim",
				config = function()
					require("telescope").setup({
						extensions = {
							["ui-select"] = {
								require("telescope.themes").get_dropdown {
								}
							}
						}
					})
					require("telescope").load_extension("ui-select")
				--	require("telescope").load_extension('harpoon')
				end
			},
		},
		{
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    } , 
  config = function() 
        vim.keymap.set('n', '<C-o>',':Neotree filesystem toggle<CR>',{}		)
  end 
	},
	{
			"ThePrimeagen/harpoon",
			branch = "harpoon2",
			config = function ()
				local harpoon = require("harpoon")
				harpoon:setup()
						vim.keymap.set("n", "<C-a>", function() harpoon:list():add() end)
						vim.keymap.set("n", "<C-m>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

						-- vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
						-- vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end)
						-- vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end)
						-- vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end)

						-- Toggle previous & next buffers stored within Harpoon list
						vim.keymap.set("n", "<C-p>", function() harpoon:list():prev() end)
						vim.keymap.set("n", "<C-n>", function() harpoon:list():next() end)

			end


	}
}
