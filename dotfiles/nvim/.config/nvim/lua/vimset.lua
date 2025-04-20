
-- My actual config
--vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set splitright")
vim.cmd("set colorcolumn=80")
vim.cmd("set spell")
vim.g.mapleader = " "
vim.g.browser = 'zen'
vim.g.zig_fmt_parse_errors = 1
vim.g.zig_fmt_autosave = 0
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.opt.autoindent=true
vim.opt.termguicolors = false


-- define a function to prompt for a shell command and execute it
local function executeshellcommand()
    -- prompt the user for a shell command
    local input = vim.fn.input('enter shell command: ')
    -- execute the shell command
    vim.api.nvim_command('! ' .. input)
end




vim.keymap.set("n","<leader>nh", ":nohl<cr>",{desc = "clear search highlights"})
vim.keymap.set("n","<leader>c",":Telescope colorscheme<cr>")

-- copy the selected text to the system clipboard in visual mode
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', { noremap = true, silent = true })

-- copy the current line to the system clipboard in normal modevim.api.nvim_set_keymap('n', '<leader>y', '"+yy', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>u', '"+yy', { noremap = true, silent = false })

-- copy the selected text to the system clipboard in visual mode and then delete it
vim.api.nvim_set_keymap('v', '<leader>l', '"+d', { noremap = true, silent = true })

-- split 
vim.keymap.set("n", "<s-v>", ":vsplit<cr>")
vim.keymap.set("n", "<s-h>", ":split<cr>")

-- map <shift>t to the executeshellcommand function in normal mode
vim.api.nvim_set_keymap('n', '<s-t>', ':lua executeshellcommand()<cr>', { noremap = true, silent = true })

--vim.keymap.set("n", "<c-t>", ":tabnew<cr>") -- open new tab
--vim.keymap.set("n", "<c-x>", ":tabclose<cr>") -- close current tab
--vim.keymap.set("n", "<c-n>", ":tabn<cr>") --  go to next tab
--vim.keymap.set("n", "<c-u>", ":tabp<cr>") --  go to previous tab


-- vimtex configuration
vim.g.vimtex_compiler_method = 'latexmk'  -- use latexmk for compilation
vim.g.vimtex_compiler_latexmk = {
    options = {
        '-silent', 
        '-interaction=nonstopmode', 
        '-pdf', 
        '-latexoption=-output-directory=.', -- output pdf in the current directory
        '-latexoption=-file-line-error', -- avoid creating extra files
    },
    clean = 1,  -- automatically clean auxiliary files after compilation
}

-------------------------------------------------------
					--- Source Required lua files ---
-------------------------------------------------------
local vimlatex = require("scripts.vimlatex")


-------------------------------------------------------
					   --- Wiki configuration ---
-------------------------------------------------------
vim.g.wiki_config = {
  home = '~/Documents/Wiki',
  markdown_dir = 'sources',
  html_dir = 'docs',
  template_path = 'bootstrap',
  theme = 'bootstrap'
}

-- Previewing browser
vim.g.wiki_preview_browser = 'zen-browser'

-- Whether to generate table of contents in html
vim.g.wiki_generate_toc = 1

-- Automatically converting markdown to html when you save markdown file
vim.g.wiki_auto_convert = 1

-- Key mappings
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- open wiki home index
map('n', '<leader>ww', ':WikiHome<CR>', opts)

-- create or follow a markdown link
map('n', '<leader>wn', ':WikiCreateFollowLink<CR>', opts)

-- create or follow a subdirectory index link
map('n', '<leader>wN', ':WikiCreateFollowDirectory<CR>', opts)

-- goto parent directory's index
map('n', '<leader>wp', ':WikiGotoParent<CR>', opts)

-- delete current link
map('n', '<leader>wd', ':WikiDeleteLink<CR>', opts)

-- rename current link
map('n', '<leader>wr', ':WikiRenameLink<CR>', opts)

-- convert current markdown into html
map('n', '<leader>wh', ':Wiki2HTML<CR>', opts)

-- convert all changed markdowns into htmls
map('n', '<leader>wH', ':WikiAll2HTML<CR>', opts)

-- convert current markdown into html and browse html in browser
map('n', '<leader>wb', ':Wiki2HTMLBrowse<CR>', opts)

-- open current markdown's corresponding html
map('n', '<leader>wo', ':WikiOpenHTML<CR>', opts)

-- paste image in vimwiki's image directory
map('n', '<leader>wi', ':WikiPasteImage<CR>', opts)
