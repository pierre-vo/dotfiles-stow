require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_position = "bottom",
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_defaults = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    shorten_path = true,
    winblend = 0,
    width = 0.75,
    preview_cutoff = 120,
    results_height = 1,
    results_width = 0.8,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    --buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}

--[[
function M.find_files()
    require('telescope.builtin').find_files({ -- or new custom picker's attach_mappings field:
        find_command = {'fd', '--type', 'f', '--no-ignore-vcs', '--color=never', '--hidden', '--follow'},
        prompt_prefix = '📄 '
    })
end

function M.git_or_find_files()
    local results = require('telescope.utils').get_os_command_output({'git', 'rev-parse', '--git-dir'})

    if results[1] then
        require('telescope.builtin').git_files({ -- or new custom picker's attach_mappings field:
            prompt_prefix = ' '
        })
    else
        M.find_files()
    end
end

-- in vim, call
-- nnoremap <C-p>      :lua require('myconfig.plugins.telescope').git_or_find_files()<CR>
]]
