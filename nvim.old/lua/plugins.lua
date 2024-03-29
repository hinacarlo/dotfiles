local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
  vim.cmd [[packadd packer.nvim]]
end

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  print("Packer is not installed")
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

return require('packer').startup(function(use)
  -- My plugins here
  -- Packer
  use "wbthomason/packer.nvim" -- Have packer manage itself
  -- Automatically set up your configuration after cloning packer.nvim

  use "norcalli/nvim-colorizer.lua"
  use "nvim-lua/plenary.nvim"
  use { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'nvim-tree/nvim-web-devicons' }
  use "nvim-tree/nvim-tree.lua"
  use "lewis6991/gitsigns.nvim"
  use "dinhhuy258/git.nvim"

  -- LSP
  use "neovim/nvim-lspconfig"
  use "glepnir/lspsaga.nvim"
  use "jose-elias-alvarez/null-ls.nvim"
  use "MunifTanjim/prettier.nvim"

  -- nvim-cmp and snippets
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "onsails/lspkind-nvim"
  use "rafamadriz/friendly-snippets"
  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip"

  -- Treesitter and TS modules
  use { 
   "nvim-treesitter/nvim-treesitter", -- > treesitter 
  run = function() require('nvim-treesitter-install').update({ with_sync = true}) end, 
  --run = ":TSUpdate") 
  }
  use "nvim-treesitter/nvim-treesitter-context" 
  use "nvim-treesitter/nvim-treesitter-refactor"
  use "p00f/nvim-ts-rainbow"
  use "windwp/nvim-ts-autotag"
  use "windwp/nvim-autopairs" 
  use "numToStr/Comment.nvim" 
  use "lukas-reineke/indent-blankline.nvim" 
  use "JoosepAlviste/nvim-ts-context-commentstring" 

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use {
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make"
  }
  use "nvim-telescope/telescope-file-browser.nvim"



  -- Colorschemes
  use "shaunsingh/nord.nvim"
  use "EdenEast/nightfox.nvim"
  use "lifepillar/vim-gruvbox8"
  use "ellisonleao/gruvbox.nvim"
  use {
    "catppuccin/nvim",
    as = "catppuccin",
  }
  use {
    "svrana/neosolarized.nvim",
    requires = { 'tjdevries/colorbuddy.nvim' }
  }
  use "mhartington/oceanic-next"
  use "folke/tokyonight.nvim"

  -- Lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
