" -------------------------------------------------------------------------------------------------
" nvim-tree settings
" -------------------------------------------------------------------------------------------------
let g:nvim_tree_quit_on_open = 1
lua << EOF
require'nvim-tree'.setup {
        disable_netrw       = true,
        hijack_netrw        = true,
        open_on_setup       = false,
        ignore_ft_on_setup  = {},
        update_to_buf_dir   = {
          enable = false,
          auto_open = true,
        },
        auto_close          = true,
        open_on_tab         = false,
        hijack_cursor       = false,
        update_cwd          = false,
        diagnostics         = {
          enable = true,
          icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
          }
        },
        update_focused_file = {
          enable      = true,
          update_cwd  = false,
          ignore_list = {}
        },
        system_open = {
          cmd  = nil,
          args = {}
        },
        view = {
          width = 30,
          height = 30,
          side = 'left',
          auto_resize = true,
          mappings = {
            custom_only = false,
            list = {}
          }
        },
        filters = {
          dotfiles = false,
          custom = {".git", "node_modules", ".cache"}
        }
      }
EOF

set termguicolors " this variable must be enabled for colors to be applied properly




