return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		{
			"s1n7ax/nvim-window-picker",
			version = "2.*",
			config = function()
				require("window-picker").setup({
					filter_rules = {
						include_current_win = false,
						autoselect_one = true,
						-- filter using buffer options
						bo = {
							-- if the file type is one of following, the window will be ignored
							filetype = { "neo-tree", "neo-tree-popup", "notify" },
							-- if the buffer type is one of following, the window will be ignored
							buftype = { "terminal", "quickfix" },
						},
					},
				})
			end,
		},
	},
	config = {
		function()
			vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
			vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
			vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
			vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })
		end,
		event_handlers = {
			{
				event = "file_open_requested",
				handler = function()
					-- auto close
					-- vimc.cmd("Neotree close")
					-- OR
					require("neo-tree.command").execute({ action = "close" })
				end,
			},
		},
	},
	keys = {
		{
			"<leader>fe",
			function()
				require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
			end,
			desc = "Explorer NeoTree (cwd)",
		},
		{ "<leader>e", "<leader>fe", desc = "Explorer NeoTree (cwd)", remap = true },
		{
			"<leader>ge",
			function()
				require("neo-tree.command").execute({ source = "git_status", toggle = true })
			end,
			desc = "Git Explorer",
		},
		{
			"<leader>be",
			function()
				require("neo-tree.command").execute({ source = "buffers", toggle = true })
			end,
			desc = "Buffer Explorer",
		},
	},
	deactivate = function()
		vim.cmd([[Neotree close]])
	end,
	-- init = function()
	--     if vim.fn.argc(-1) == 1 then
	--         local stat = vim.uv.fs_stat(vim.fn.argv(0))
	--         if stat and stat.type == "directory" then
	--             require("neo-tree")
	--         end
	--     end
	-- end,
	init = function()
		-- FIX: use `autocmd` for lazy-loading neo-tree instead of directly requiring it,
		-- because `cwd` is not set up properly.
		vim.api.nvim_create_autocmd("BufEnter", {
			group = vim.api.nvim_create_augroup("Neotree_start_directory", { clear = true }),
			desc = "Start Neo-tree with directory",
			once = true,
			callback = function()
				if package.loaded["neo-tree"] then
					return
				else
					local stats = vim.uv.fs_stat(vim.fn.argv(0))
					if stats and stats.type == "directory" then
						require("neo-tree")
					end
				end
			end,
		})
	end,
	opts = {
		sources = { "filesystem", "buffers", "git_status" },
		open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
		filesystem = {
			bind_to_cwd = false,
			follow_current_file = { enabled = true },
			use_libuv_file_watcher = true,
		},
	},
	default_component_configs = {
		container = {
			enable_character_fade = true,
		},
		indent = {
			indent_size = 2,
			padding = 1, -- extra padding on left hand side
			-- indent guides
			with_markers = true,
			indent_marker = "│",
			last_indent_marker = "└",
			highlight = "NeoTreeIndentMarker",
			-- expander config, needed for nesting files
			with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
			expander_collapsed = "",
			expander_expanded = "",
			expander_highlight = "NeoTreeExpander",
		},
		icon = {
			folder_closed = "",
			folder_open = "",
			folder_empty = "󰜌",
			-- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
			-- then these will never be used.
			default = "*",
			highlight = "NeoTreeFileIcon",
		},
		modified = {
			symbol = "[+]",
			highlight = "NeoTreeModified",
		},
		name = {
			trailing_slash = false,
			use_git_status_colors = true,
			highlight = "NeoTreeFileName",
		},
		git_status = {
			symbols = {
				-- Change type
				added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
				modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
				deleted = "✖", -- this can only be used in the git_status source
				renamed = "󰁕", -- this can only be used in the git_status source
				-- Status type
				untracked = "",
				ignored = "",
				unstaged = "󰄱",
				staged = "",
				conflict = "",
			},
		},
		-- If you don't want to use these columns, you can set `enabled = false` for each of them individually
		file_size = {
			enabled = true,
			required_width = 64, -- min width of window required to show this column
		},
		type = {
			enabled = true,
			required_width = 122, -- min width of window required to show this column
		},
		last_modified = {
			enabled = true,
			required_width = 88, -- min width of window required to show this column
		},
		created = {
			enabled = true,
			required_width = 110, -- min width of window required to show this column
		},
		symlink_target = {
			enabled = false,
		},
	},
}
