return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			"3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		lazy = false,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = true, -- this is equalent to setup({}) function
	},
	{
		"alexghergh/nvim-tmux-navigation",
		opts = {
			disable_when_zoomed = true, -- defaults to false
			keybindings = {
				left = "<M-h>",
				down = "<M-j>",
				up = "<M-k>",
				right = "<M-l>",
				last_active = "<M-\\>",
				next = "<M-Space>",
			},
		},
	},
	{
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
		opts = {
			case_insensitive = true,
			keys = "etovxqpdygfblzhckisuran",
		},
	},
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = true,
	},
	{
		"numToStr/Comment.nvim",
		opts = {
			-- add any options here
		},
		lazy = false,
	},
}
