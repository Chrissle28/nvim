local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	"nvim-lua/plenary.nvim",
	"bluz71/vim-nightfly-guicolors",
	"christoomey/vim-tmux-navigator",
	"szw/vim-maximizer",
	"tpope/vim-surround",
	"vim-scripts/ReplaceWithRegister",
	"numToStr/Comment.nvim",
	"nvim-tree/nvim-tree.lua",
	"nvim-tree/nvim-web-devicons",
	"nvim-lualine/lualine.nvim",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",
	{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	"williamboman/mason.nvim",
	"neovim/nvim-lspconfig",
	"williamboman/mason-lspconfig.nvim",
	"hrsh7th/cmp-nvim-lsp",
	{
		"glepnir/lspsaga.nvim",
		branch = "main",
		requires = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	},
	"jose-elias-alvarez/typescript.nvim",
	"onsails/lspkind.nvim",
	"nvimtools/none-ls.nvim",
	"jayp0521/mason-null-ls.nvim",
	{
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	},
	"windwp/nvim-autopairs",
	{ "windwp/nvim-ts-autotag", after = "nvim-treesitter" },
	"lewis6991/gitsigns.nvim",
	{
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = true,
	},
	"github/copilot.vim",
	"goolord/alpha-nvim",
	"folke/trouble.nvim",
}

require("lazy").setup(plugins)
