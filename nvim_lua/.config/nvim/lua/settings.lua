local cmd = vim.cmd
local g = vim.g
local fn = vim.fn
local wo = vim.wo
local bo = vim.bo
local o = vim.o
local map = vim.api.nvim_set_keymap

cmd('syntax on')
-- Disable builtins plugins
--g.loaded_netrwPlugin = 1 -- Disable netrw it has problem with symlinks and I am on nixos
--g.loaded_2html_plugin = 1 -- converts lines or the entire buffer to html code
g.loaded_matchit = 1 -- extends matching when using % not really needed though
g.loaded_gzip = 1 -- disable editing compressed files
g.loaded_tarPlugin = 1 -- disable navigating tar files
g.loaded_zipPlugin = 1 -- disable navigating zip files
g.loaded_tutor_mode_plugin = 1 -- disable vim tutor
g.loaded_matchparen = 1 -- disable the match paren plugin it is causing extreme slow downs
g.loaded_python_provider = 0 -- disable the python 2 health checks
g.loaded_python3_provider = 0 -- disable the python 3 health checks
g.loaded_ruby_provider = 0 -- disable the ruby health checks
g.loaded_perl_provider = 0 -- disable the perl health checks
g.loaded_node_provider = 0 -- disable the node health checks
---------------------------
o.scrolloff = 10 -- minimal number of lines to keep above and below the cursor
o.lazyredraw = true -- don't redraw screen when using macros
--o.laststatus = 1 -- only show the statusline when a split exists
o.hidden = true -- allow us to switch buffers easily
o.termguicolors = true -- 24-bit RGB in terminal
o.guicursor = '' -- disable the line cursor
o.fillchars = 'diff:∙,fold:·,vert:│,eob: ' -- characters used to fill statuslines and seperators
o.tabstop = 2 -- 4 spaces equals to one tab
o.shiftwidth = 2 -- number of spaces for each step of autoindent
--o.undodir = 
o.undofile = true
o.expandtab = false
o.showbreak = "↳  "
o.listchars = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←"
-- Ignore these files
local ignore = o.wildignore
ignore = ignore .. '*.o,*.obj,*.bin,*.dll,*.exe,'
ignore = ignore .. '*/.git/*,*/.svn/*,*/__pycache__/*,*/build/**,'
ignore = ignore .. '*.pyc,*.out,'
ignore = ignore .. '*.DS_Store,'
ignore = ignore .. '*.aux,*.bbl,*.blg,*.brf,*.fls,*.fdb_latexmk,*.synctex.gz,*.pdf,'
o.wildignore = ignore -- Ignore certain files and folders when globbing
---------------------
bo.synmaxcol = 500 -- syntax highlighting for 500 colums only
bo.tabstop = 2 -- 4 spaces equals to one tab
bo.shiftwidth = 2 -- number of spaces for each step of autoindent
bo.expandtab = false
bo.textwidth = 120 -- Maximum width of text that is being inserted
wo.foldenable = false -- no folding
wo.wrap = false -- dont wrap the lines
o.backup = false -- no backup file
o.writebackup = false -- no backup file
o.swapfile = false -- no swap file
o.encoding = 'utf-8'
o.mouse = 'a'

---------- Plugins ----------
--cmd('packadd! tabular')
--cmd('packadd! vim-commentary')
--cmd('packadd! vim-dirvish')
--cmd('packadd! vim-repeat')
--cmd('packadd! vim-surround')
--cmd('packadd! vim-startuptime')
--cmd('packadd! nvim-web-devicons')
--cmd('packadd! galaxyline')

--------- ColorsScheme -------
cmd('packadd! nvim-solarized-lua')
o.bg = 'dark'
g.solarized_visibility = 'normal'
vim.g.solarized_diffmode = 'high'
g.solarized_statusline = 'flat'
if vim.fn.has('gui_running') == 0 then
    vim.g.solarized_termtrans = 0
else
    vim.g.solarized_termtrans = 1
end
cmd('colorscheme solarized-high')

----- Syntax Plugins ------
--cmd('packadd! vim-nix')
--cmd('packadd! vim-fish')
--cmd('packadd! vim-cpp-modern')
--cmd('packadd! vim-cmake-syntax')
--cmd('packadd! vim-glsl')
--cmd('packadd! vim-go')
--cmd('packadd! BetterLua')



-- Line Numbers
wo.nu = true -- move to normal lineNumbers
