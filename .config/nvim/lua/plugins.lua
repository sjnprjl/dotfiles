local packer = require("packer")
packer.init({
	git = {
		clone_timeout = false,
	},
})
return packer.startup(function(use)
	use("wbthomason/packer.nvim")
	use("neovim/nvim-lspconfig")
	use("nvim-lua/plenary.nvim")
	use({
		"ojroques/nvim-lspfuzzy",
		requires = {
			{ "junegunn/fzf" },
			{ "junegunn/fzf.vim" }, -- to enable preview (optional)
		},
	})
	use({
		"ms-jpq/coq_nvim",
		{ branch = "coq" },
	})
	use({
		"ms-jpq/coq.artifacts",
		{ branch = "artifacts" },
	})
	use({
		"ms-jpq/coq.thirdparty",
		{ branch = "3p" },
	})
	use("f-person/git-blame.nvim")
	use({
		"nvim-telescope/telescope.nvim",
	})
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",

		use({
			"kyazdani42/nvim-tree.lua",
			requires = {
				"kyazdani42/nvim-web-devicons", -- optional, for file icons
			},
		}),
	})
	-- use("jose-elias-alvarez/null-ls.nvim")
	use("MunifTanjim/prettier.nvim")

	use({
		"lewis6991/gitsigns.nvim",
		-- tag = 'release' -- To use the latest release
	})

	-- use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })

	use("windwp/nvim-autopairs")

	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	use("rafamadriz/neon")
	use({
		-- Optional but recommended
		"nvim-treesitter/nvim-treesitter",
		"lewis6991/spellsitter.nvim",
	})
	use("yamatsum/nvim-cursorline")
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	use("Pocco81/AutoSave.nvim")
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	use({ "williamboman/mason.nvim" })

	use("marko-cerovac/material.nvim")
	-- using packer.nvim
	use({ "akinsho/bufferline.nvim", tag = "v2.*", requires = "kyazdani42/nvim-web-devicons" })
	-- use("hrsh7th/cmp-nvim-lsp")
	-- use("hrsh7th/cmp-buffer")
	-- use("hrsh7th/cmp-path")
	-- use("hrsh7th/cmp-cmdline")
	-- use("hrsh7th/nvim-cmp")
	-- use("SirVer/ultisnips")
	-- use("kdheepak/lazygit.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use({ "nvim-telescope/telescope-ui-select.nvim" })
	-- use {'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim'}
	use("sbdchd/neoformat")
end)
