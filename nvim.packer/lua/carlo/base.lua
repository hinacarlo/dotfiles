local options = {
    backup = false,                          -- creates a backup file
    -- clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
    cmdheight = 1,                           -- more space in the neovim command line for displaying messages
    completeopt = { "menuone", "noselect" }, -- mostly just for cmp
    conceallevel = 0,                        -- so that `` is visible in markdown files
    fileencoding = "utf-8",                  -- the encoding written to a file
    --	hlsearch = true,                         -- highlight all matches on previous search pattern
    ignorecase = true,                       -- ignore case in search patterns
    mouse = "a",                             -- allow the mouse to be used in neovim
    pumheight = 10,                          -- pop up menu height
    showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
    showtabline = 2,                         -- always show tabs
    smartcase = true,                        -- smart case
    smartindent = true,                      -- make indenting smarter again
    splitbelow = true,                       -- force all horizontal splits to go below current window
    splitright = true,                       -- force all vertical splits to go to the right of current window
    swapfile = true,                        -- creates a swapfile
    termguicolors = true,                    -- set term gui colors (most terminals support this)
    timeoutlen = 100,                        -- time to wait for a mapped sequence to complete (in milliseconds)
    undofile = true,                         -- enable persistent undo
    updatetime = 300,                        -- faster completion (4000ms default)
    writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    expandtab = true,                        -- convert tabs to spaces
    shiftwidth = 4,                          -- the number of spaces inserted for each indentation
    tabstop = 4,                             -- insert 2 spaces for a tab
    softtabstop = 4,
    cursorline = false,                       -- highlight the current line
    number = true,                           -- set numbered lines
    relativenumber = true,                  -- set relative numbered lines
    numberwidth = 4,                         -- set number column width to 2 {default 4}
    signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
    wrap = false,                            -- display lines as one long line
    scrolloff = 10,                           -- is one of my fav
    sidescrolloff = 8,
    incsearch = true,
    autoindent = true,
    showcmd = true,
    laststatus = 2,
    breakindent = true,
    backspace = 'start,eol,indent',
}


--vim.opt.shortmess:append "c"
--vim.opt.path:append { '**' }
--vim.opt.wildignore:append { '*/node_modules/*' }
--vim.o.background = "dark"
--vim.o.background = "light"
--vim.opt.path:append { '**' }

-- turn off paste mode
vim.api.nvim_create_autocmd("InsertLeave", {
    pattern = '*',
    command = "set nopaste"
})

for k, v in pairs(options) do
    vim.opt[k] = v
end

--vim.cmd [[colorscheme OceanicNext]]
--vim.cmd [[colorscheme tokyonight]]
--vim.g.tokyonight_style = "day"
--vim.g.tokyonight_style = "storm"

-- vim.g.catppuccin_flavour = "latte"

--vim.cmd [[colorscheme catppuccin]]
--vim.cmd [[colorscheme gruvbox]]
--vim.cmd [[colorscheme nightfox]]
--vim.cmd [[colorscheme neosolarized]]
vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
--vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
vim.cmd [[set directory=~/.vim/.swp//]]
--vim.cmd [[ autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE]]
