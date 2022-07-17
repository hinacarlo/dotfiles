local gruvbox = {
    n = "#a89985",
    i = "#84a598",
    c = "#8fbf7f",
    v = "#fc802d",    -- etc...
}

local tamp = {
	n = "#986fec",
	i = "#e86671",
	c = "#e86671",
	v = "#e27d60"
}

require('staline').setup {
	defaults = {
		-- left_separator  = "",
		-- right_separator = "",
		-- cool_symbol     = " ",       -- Change this to override defult OS icon.
		-- full_path       = false,
		-- mod_symbol      = "  ",
		-- lsp_client_symbol = " ",
		line_column     = "[%l/%L] :%c 並%p%% ", -- `:h stl` to see all flags.

		-- fg              = "#000000",  -- Foreground text color.
		-- bg              = "none",     -- Default background is transparent.
		-- inactive_color  = "#303030",
		-- inactive_bgcolor = "none",
		-- true_colors     = false,       -- true lsp colors.
		-- font_active     = "none",     -- "bold", "italic", "bold,italic", etc
		-- branch_symbol   = " ",
		cool_symbol = "  ",
		left_separator = "",
		right_separator = "",
		bg = "#303030",
		full_path = false,
		branch_symbol = " "

	},
	mode_colors = gruvbox,
	-- mode_colors = {
	-- 	n = "#2bbb4f",
	-- 	i = "#986fec",
	-- 	c = "#e27d60",
	-- 	v = "#4799eb",   -- etc..

	-- },
	mode_icons = {
		n = " Normal",
		i = " ",
		c = " ",
		v = " ",   -- etc..
	},
	-- sections = {
	-- 	left = { '- ', '-mode', 'left_sep_double', ' ', 'branch' },
	-- 	mid  = { 'file_name' },
	-- 	right = { 'cool_symbol','right_sep_double', '-line_column' },
	sections = {
		left = {
			'- ', '-mode', 'left_sep_double',
			'file_name', '  ', 'branch'
		},
		mid  = {'lsp'},
		right= {
			'cool_symbol', '  ',
			vim.bo.fileencoding:upper(), 'right_sep_double', '-line_column'
		}
	},
	special_table = {
		NvimTree = { 'NvimTree', ' ' },
		packer = { 'Packer',' ' },        -- etc
	},
	lsp_symbols = {
		Error=" ",
		Info=" ",
		Warn=" ",
		Hint="",
	},
}

vim.cmd [[au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == "NvimTree" | set laststatus=0 | else | set laststatus=2 | endif]]
