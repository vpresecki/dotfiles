local plugins = {

	-- theme
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = require("vp.plugins.surround")
	},
	{
		"m4xshen/autoclose.nvim"
	},

	-- syntax color and highlighting
	{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

	-- lsp-config
	{ "folke/neodev.nvim" },
	{ 'williamboman/mason.nvim' },
	{ 'williamboman/mason-lspconfig.nvim' },
	{ 'neovim/nvim-lspconfig' },
	{ 'mhartington/formatter.nvim' }, -- still to check
	-- autocomplete
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'hrsh7th/cmp-buffer' },
	{ 'hrsh7th/cmp-path' },
	{ 'hrsh7th/cmp-cmdline' },
	{ 'hrsh7th/nvim-cmp' },
	{ 'L3MON4D3/LuaSnip' },
	{ 'saadparwaiz1/cmp_luasnip' },
	-- tmux
	{ 'christoomey/vim-tmux-navigator' }

}

local opts = {}


return {plugins, opts}
