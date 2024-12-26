require'nvim-treesitter.configs'.setup {

	-- first five must be always intalled
	ensure_installed  = { "c", "lua", "vim", "vimdoc", "query", "bash", "dockerfile", "json",  "gomod", "gowork", "go" },

	-- Automatically install missing parsers when entering buffer
	auto_install = true,

	highlight = {
		enable = true,
	},
}
