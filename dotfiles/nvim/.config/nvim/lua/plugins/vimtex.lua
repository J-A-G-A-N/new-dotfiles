return {
  {
    "lervag/vimtex",
--    lazy = true,  -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here
      vim.g.vimtex_view_method = "zathura"
    end,
    config = function()
      -- Define the function to compile and view
      local function compile_and_view()
        vim.cmd(':VimtexCompile')
        vim.cmd(':VimtexView')
      end

      -- Map the function to a keybinding (e.g., <leader>cv)
      vim.keymap.set('n', '<leader>cv', compile_and_view, { noremap = true, silent = true })
    end,
  },
}






