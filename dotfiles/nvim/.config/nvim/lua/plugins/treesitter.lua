return {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate" ,
configs = function () 
    local config = require("nvim-treesitter.configs")
   configs.setup({
					auto_install = true,
          ensure_installed = { "c", "lua", "vim","python"  , "cpp"  },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
        })
 
  end, 
}





