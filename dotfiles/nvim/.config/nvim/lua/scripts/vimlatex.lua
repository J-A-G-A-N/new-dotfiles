-- LaTeX compilation and viewing setup
local M = {}

-- Function to compile LaTeX using latexmk
function M.compile_latex()
    -- Create output directory if it doesn't exist
    vim.fn.system('mkdir -p out')
    
    -- Get the current file path
    local file_path = vim.fn.expand('%:p')
    local file_dir = vim.fn.expand('%:p:h')
    
    -- Build the latexmk command
    -- -pdf: generate PDF output
    -- -outdir=out: put all output files in 'out' directory
    -- -interaction=nonstopmode: don't stop on errors
    local cmd = string.format(
        'cd %s && latexmk -pdf -outdir=out -interaction=nonstopmode %s',
        vim.fn.shellescape(file_dir),
        vim.fn.shellescape(file_path)
    )
    
    -- Execute the command
    vim.fn.system(cmd)
end

-- Function to view PDF
function M.view_pdf()
    local pdf_path = vim.fn.expand('%:p:r') .. '.pdf'
    pdf_path = string.gsub(pdf_path, vim.fn.expand('%:p:h'), vim.fn.expand('%:p:h') .. '/out')
    
    -- Check if PDF exists
    if vim.fn.filereadable(pdf_path) == 0 then
        print("PDF file not found: " .. pdf_path)
        return
    end
    
    -- Check if Zathura is already running for this PDF
    local check_cmd = string.format('pgrep -f "zathura.*%s"', pdf_path)
    local running = vim.fn.system(check_cmd)
    
    if running == "" then
        -- Start Zathura in the background
        local cmd = string.format('zathura "%s" &', pdf_path)
        vim.fn.system(cmd)
    end
end

-- Create autocommand group for LaTeX
local latex_augroup = vim.api.nvim_create_augroup('LaTeX', { clear = true })

-- Set up autocommand for compilation on save
vim.api.nvim_create_autocmd('BufWritePost', {
    group = latex_augroup,
    pattern = '*.tex',
    callback = function()
        M.compile_latex()
        M.view_pdf()
    end
})

-- Set up keybindings
vim.keymap.set('n', '<Leader>lc', M.compile_latex, { desc = 'Compile LaTeX' })
vim.keymap.set('n', '<Leader>lv', M.view_pdf, { desc = 'View PDF' })

vim.api.nvim_create_user_command("CompileLatex",function()
	M.compile_latex()
end,{})
vim.api.nvim_create_user_command("ViewLatex",function ()
	M.view_pdf()
end,{})





return M
