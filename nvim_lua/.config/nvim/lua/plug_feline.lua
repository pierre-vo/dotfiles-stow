local lsp = require('feline.providers.lsp')
local vi_mode_utils = require('feline.providers.vi_mode')

--local b = vim.b
--local fn = vim.fn

local colors = {
    black = '#002B36',
    skyblue = '#268BD2',
    cyan = '#2AA198',
    green = '#859900',
    oceanblue = '#0066cc',
    magenta = '#D33682',
    orange = '#CB4B16',
    red = '#DC322F',
    violet = '#6C71C4',
    white = '#93A1A1',
    yellow = '#B58900'
}

-- This table is equal to the default separators table
local separators = {
    vertical_bar = '┃',
    vertical_bar_thin = '│',
    left = '',
    right = '',
    block = '█',
    left_filled = '',
    right_filled = '',
    slant_left = '',
    slant_left_thin = '',
    slant_right = '',
    slant_right_thin = '',
    slant_left_2 = '',
    slant_left_2_thin = '',
    slant_right_2 = '',
    slant_right_2_thin = '',
    left_rounded = '',
    left_rounded_thin = '',
    right_rounded = '',
    right_rounded_thin = '',
    circle = '●'
}

-- This table is equal to the default vi_mode_colors table
local vi_mode_colors = {
    NORMAL = 'green',
    OP = 'green',
    INSERT = 'red',
    VISUAL = 'skyblue',
    BLOCK = 'skyblue',
    REPLACE = 'violet',
    ['V-REPLACE'] = 'violet',
    ENTER = 'cyan',
    MORE = 'cyan',
    SELECT = 'orange',
    COMMAND = 'green',
    SHELL = 'green',
    TERM = 'green',
    NONE = 'yellow'
}

local function file_osinfo()
    local os = vim.bo.fileformat:upper()
    local icon
    if os == 'UNIX' then
        icon = ' '
    elseif os == 'MAC' then
        icon = ' '
    else
        icon = ' '
    end
    return icon .. os
end

local comps = {
  left_bar = {
      provider = '▊ ',
      hl = {
          fg = 'skyblue'
      }
  },
  vi_mode = {
      provider = 'vi_mode',
      hl = function()
          local val = {}

          val.name = vi_mode_utils.get_mode_highlight_name()
          val.bg = vi_mode_utils.get_mode_color()
          val.fg = 'white'
          val.style = 'bold'

          return val
      end,
      right_sep = {
          '', 'slant_right_2',
      },
  },
  file = {
    info = {
        provider = 'file_info',
        file_modified_icon = "",
        hl = {
            fg = 'white',
            bg = 'oceanblue',
            style = 'bold'
        },
        left_sep = {
            ' ', 'slant_left_2',
            {str = ' ', hl = {bg = 'oceanblue', fg = 'NONE'}}
        },
        right_sep = {'slant_right_2', ' '}
    },
    size = {
      provider = 'file_size',
      enabled = function() return fn.getfsize(fn.expand('%:p')) > 0 end,
      right_sep = {
          ' ',
          {
              str = 'slant_left_2_thin',
              hl = {
                  fg = 'fg',
                  bg = 'bg'
              }
          },
          ' '
      },
    },
    position = {
      provider = 'position',
      right_sep = {
          ' ',
          {
              str = 'slant_right_2_thin',
              hl = {
                  fg = 'fg',
                  bg = 'bg'
              }
          }
      },
      left_sep = ' '
    },
    encoding = {
      provider = 'file_encoding',
      hl = {
        fg = 'white',
        bg = 'bg',
        --style = 'bold'
      },
      left_sep = ' ',
      right_sep = ' '
    },
    percentage = {
        provider = 'line_percentage',
        hl = {
            style = 'bold'
        },
        left_sep = ' ',
        right_sep = ' '
    },
    --[[components.right.active[6] = {
        provider = 'scroll_bar',
        hl = {
            fg = 'skyblue',
            style = 'bold'
        }
    }]]
    type = {
      provider = 'file_type',
      hl = {
          style = 'bold',
          fg = 'green'
      },
      right_sep = {
          ' ',
          {
              str = 'slant_right_2_thin',
              hl = {
                  fg = 'fg',
                  bg = 'bg'
              }
          }
      },
      left_sep = ''
    },
  },
  diagnos = {
      err = {
              --' ' 
        provider = 'diagnostic_errors',
        enabled = function() return lsp.diagnostics_exist('Error') end,
        hl = { fg = 'red' }
      },
      warn = {
              --' '
        provider = 'diagnostic_warnings',
        enabled = function() return lsp.diagnostics_exist('Warning') end,
        hl = { fg = 'yellow' }
      },
      info = {
              --' '
        provider = 'diagnostic_hints',
        enabled = function() return lsp.diagnostics_exist('Hint') end,
        hl = { fg = 'cyan' }
      },
      hint = {
        provider = 'diagnostic_hints',
        enabled = function() return lsp.diagnostics_exist('Hint') end,
        hl = { fg = 'cyan' }
      },
  },
  lsp = {
      name = {
          provider = 'lsp_client_names',
          left_sep = ' ',
          icon = ' ',
          hl = {
              fg = colors.yellow
          }
      }
  },
  git = {
      branch = {
          provider = 'git_branch',
          icon = ' ',
          hl = {
              fg = colors.violet,
              style = 'bold'
          },
          left_sep = ' ',
          --right_sep = ' ',
          enabled = function() return vim.b.gitsigns_status_dict ~= nil end
      },
      add = {
          provider = 'git_diff_added',
          hl = {
              fg = colors.green
          }
      },
      change = {
          provider = 'git_diff_changed',
          hl = {
              fg = colors.orange
          }
      },
      remove = {
          provider = 'git_diff_removed',
          hl = {
              fg = colors.red
          }
      }
  }
}

local properties = {
    force_inactive = {
        filetypes = {},
        buftypes = {},
        bufnames = {}
    }
}

local components = {
    left = {
        active = {
          comps.vi_mode,
          comps.git.branch,
          comps.file.info,
          comps.lsp.name,
        },
        inactive = {}
    },
    mid = {
        active = {
          comps.diagnos.err,
          comps.diagnos.warn,
          comps.diagnos.hint,
          comps.diagnos.info,
        },
        inactive = {}
    },
    right = {
        active = {
          comps.git.add,
          comps.git.change,
          comps.git.remove,
          --comps.file.os,
          comps.file.encoding,
          comps.file.type,
          comps.file.position,
          comps.file.percentage,
        },
        inactive = {}
    }
}

properties.force_inactive.filetypes = {
    'NvimTree',
    'dbui',
    'packer',
    'startify',
    'fugitive',
    'fugitiveblame'
}

properties.force_inactive.buftypes = {
    'terminal'
}

require('feline').setup({
    default_fg = '#839496',
    default_bg = '#073642',
    colors = colors,
    separators = separators,
    components = components,
    properties = properties,
    vi_mode_colors = vi_mode_colors
})



