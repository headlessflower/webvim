return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = "Neotree",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      close_if_last_window = true,
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        follow_current_file = {
          enabled = true,
        },
        use_libuv_file_watcher = true,
      },
      window = {
        position = "left",
        width = 32,
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      defaults = {
        file_ignore_patterns = {
          "node_modules",
          ".git/",
          ".output",
          ".nuxt",
          "dist",
          "build",
        },
      },
      extensions = {
        projects = {
          attach_mappings = function(prompt_bufnr, map)
            local actions = require("telescope.actions")
            local state = require("telescope.actions.state")
            local project = require("project_nvim.project")

            actions.select_default:replace(function()
              local selected_entry = state.get_selected_entry()
              if selected_entry == nil then
                actions.close(prompt_bufnr)
                return
              end
              local project_path = selected_entry.value
              actions.close(prompt_bufnr)
              project.set_pwd(project_path, "telescope")
              vim.cmd("Dashboard")
            end)
            return true
          end,
        },
      },
    },
  },
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    opts = {},
  },
}
