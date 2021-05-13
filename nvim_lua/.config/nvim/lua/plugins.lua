-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
-- vim._update_package_paths()

-- Automatically run :PackerCompile whenever plugins.lua is updated
vim.cmd [[ autocmd BufWritePost packed.lua PackerCompile ]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Some requied Lua plugins
  use {
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",
  }

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use {
  'nvim-telescope/telescope.nvim',
  requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  -- Theme
  use {
    "ishan9299/nvim-solarized-lua",
    -- config = function() cmd('colorscheme solarized-flat') end
  }
  
	-- Git
  use {
    'lewis6991/gitsigns.nvim',
      requires = {
        'nvim-lua/plenary.nvim'
      },
      config = function()
        require('gitsigns').setup()
      end
  }

	-- align
	use {'godlygeek/tabular'; opt = true; cmd = {'Tabularize'}};

	-- syntax files
	use { 'bfrg/vim-cpp-modern'}
	use { 'vim-python/python-syntax'}

	-- tpope
	use {
		'tpope/vim-commentary';
		opt = true;
		keys = {{'n'; 'gcc'}; {'x'; 'gc'}; {'o'; 'gc'}; {'n'; 'gc'}};
	};

	--use {
	--	'tpope/vim-unimpaired';
	--};

	use {
		'tpope/vim-surround';
		-- opt = true;
		-- keys = {{'n'; 'yss'}; {'x'; 'S'}; {'o'; 'ys'};{'n'; 'ys'}};
	};
	use {
		 'tpope/vim-rsi',
		 opt=true ,
		 event = 'InsertEnter *'
	};
	use {
		'tpope/vim-repeat';
		-- opt = true;
		-- keys = {{'n'; '.'}};
	};

  -- Misc
	use { 'folke/which-key.nvim' }
	use { 'kyazdani42/nvim-tree.lua', requires = {{'kyazdani42/nvim-web-devicons'}, }}  
  use { 'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}}
  --use { 'glepnir/galaxyline.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}}
end)
