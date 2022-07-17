local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup{function(use)
  -- Packer
  use "wbthomason/packer.nvim" -- Have packer manage itself

  -- Utilities 
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim"
  use "kyazdani42/nvim-web-devicons"
  use "antoinemadec/FixCursorHold.nvim"
  use "rcarriga/nvim-notify"
  use "goolord/alpha-nvim"
  use "folke/which-key.nvim"
  use "lewis6991/impatient.nvim"
  use "norcalli/nvim-colorizer.lua"

  
  -- Nvim Tree
  use "kyazdani42/nvim-tree.lua"

  --> Treesitter & treesitter modules/plugins
	use { 
      "nvim-treesitter/nvim-treesitter", --> treesitter
      run = ":TSUpdate" } 
	use "nvim-treesitter/nvim-treesitter-refactor"
	use "p00f/nvim-ts-rainbow"
  use "windwp/nvim-ts-autotag"
  use "windwp/nvim-autopairs"
  use "numToStr/Comment.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "JoosepAlviste/nvim-ts-context-commentstring"


  -- nvim-cmp and snippets
  use "hrsh7th/nvim-cmp"
  use "rafamadriz/friendly-snippets"
  use "L3MON4D3/LuaSnip"
  use "hrsh7th/cmp-nvim-lsp"
  use "saadparwaiz1/cmp_luasnip"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  use "tami5/lspsaga.nvim"

  -- Status Line
  -- use "tamton-aquib/staline.nvim"
  use "nvim-lualine/lualine.nvim"

  -- Buffer Line
  use {
    "akinsho/bufferline.nvim", tag = "v2.*", 
    requires = "kyazdani42/nvim-web-devicons"
  }

  --Telescope
  use {
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make"
  }
  use "nvim-telescope/telescope.nvim"

  -- Toggle Terminal
  use "akinsho/toggleterm.nvim"

  --Git
  use "lewis6991/gitsigns.nvim"

  -- colors
  use "shaunsingh/nord.nvim"
  use "EdenEast/nightfox.nvim"
  use "lifepillar/vim-gruvbox8"
  use "ellisonleao/gruvbox.nvim"
  use {
  "catppuccin/nvim",
  as = "catppuccin",
  }


  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end, config = {
  -- Move to lua dir so impatient.nvim can cache it
  compile_path = vim.fn.stdpath('config')..'/plugin/packer_compiled.lua'
  }
}
