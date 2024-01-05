return  {
	"nvim-lua/plenary.nvim",
	"folke/tokyonight.nvim",
	{ 
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup {
				icons = false
			}
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		--build = ":TSUpdate",
	},
	"mbbill/undotree",
	"tpope/vim-fugitive",
	"folke/zen-mode.nvim",
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		opts = {} -- this is equalent to setup({}) function
	},


}
