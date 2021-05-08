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

  -- Theme
  use {
    "ishan9299/nvim-solarized-lua",
    -- config = function() cmd('colorscheme solarized-flat') end
  }


end)
