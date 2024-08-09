return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "kyazdani42/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")

		local hide_in_width = function()
			return vim.fn.winwidth(0) > 80
		end

		local diagnostics = {
			"diagnostics",
			sources = { "nvim_diagnostic" },
			sections = { "error", "warn" },
			symbols = { error = " ", warn = " ", info = " ", hint = " " },
			-- symbols = { error = " ", warn = " " },
			colored = false,
			update_in_insert = false,
			always_visible = false,
		}

		local diff = {
			"diff",
			colored = false,
			symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
			cond = hide_in_width,
		}

		local mode = {
			"mode",
			fmt = function(str)
				return "-- " .. str .. " --"
			end,
		}

		local filetype = {
			"filetype",
			icons_enabled = true,
			-- icon = nil,
		}

		-- local branch = {
		--     "branch",
		--     icons_enabled = true,
		--     icon = "",
		-- }

		local location = {
			"location",
			padding = 0,
		}

		local filename = {
			"filename",
			file_status = true,
			path = 1,
		}

		local spaces = function()
			return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
		end

		lualine.setup({
			options = {
				icons_enabled = true,
				--theme = "tokyonight",
				--theme = "gruvbox",
				--theme = "catppuccin",
				--theme = "solarized_dark",
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
				always_divide_middle = true,
			},
			sections = {
				lualine_a = { "mode" },
				-- lualine_b = { branch },
				lualine_b = { "branch" },
				lualine_c = { filename },
				-- lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_x = { diff, diagnostics, "encoding", filetype },
				lualine_y = { location },
				lualine_z = { "progress" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {
				lualine_a = {
					{
						"buffers",
						mode = 4,
					},
				},
			},
			winbar = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			inactive_winbar = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			extensions = {},
		})
	end,
}
