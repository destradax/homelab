-- plugins/telescope.lua:
return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim'
  },
  config = function()
    local actions = require('telescope.actions')

    require('telescope').setup({
      defaults = {
        sorting_strategy = 'ascending',
        layout_strategy = 'vertical',
        layout_config = {
          width = 0.95,
          height = 0.95,
          mirror = true,
          prompt_position = 'top'
        },
        mappings = {
          n = {
            ["<C-t>"] = actions.send_selected_to_qflist + actions.open_qflist
          }
        }
      },
      pickers = {
        buffers = {
          initial_mode = "normal"
        },
        grep_string = {
          initial_mode = "normal"
        }
      }
    })

    local builtin = require('telescope.builtin')

    vim.keymap.set('n', '<leader>O', builtin.find_files, {})
    vim.keymap.set('n', '<leader>o', builtin.git_files, {})
    vim.keymap.set('n', '<leader>f', function()
      builtin.grep_string({
        search = vim.fn.input("Grep > ")
      })
    end)

    vim.keymap.set('n', '<leader>*', builtin.grep_string, {})
    vim.keymap.set('n', '<leader>G', builtin.git_branches, {})
    vim.keymap.set('n', '<leader>b', builtin.buffers, {})
  end
}
