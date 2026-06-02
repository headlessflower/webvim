return {
  {
    "mason-org/mason.nvim",
    cmd = "Mason",
    opts = {},
  },

  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = {
        "lua_ls",
        "html",
        "cssls",
        "jsonls",
        "yamlls",
        "bashls",
        "emmet_language_server",
        "tailwindcss",
        "vtsls",
        "vue_ls",
      },

      -- We manually enable them below so we control the config order.
      automatic_enable = false,
    },
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "saghen/blink.cmp",
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
    },

    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("webvim-lsp-attach", { clear = true }),
        callback = function(event)
          local bufnr = event.buf

          local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, {
              buffer = bufnr,
              desc = desc,
            })
          end

          map("n", "gd", vim.lsp.buf.definition, "Go to definition")
          map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
          map("n", "gR", vim.lsp.buf.references, "References")
          map("n", "gi", vim.lsp.buf.implementation, "Implementation")
          map("n", "K", vim.lsp.buf.hover, "Hover")
          map("n", "<leader>lr", vim.lsp.buf.rename, "Rename")
          map("n", "<leader>la", vim.lsp.buf.code_action, "Code action")
        end,
      })

      local vue_language_server_path =
          vim.fn.stdpath("data")
          .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

      local vue_plugin = {
        name = "@vue/typescript-plugin",
        location = vue_language_server_path,
        languages = { "vue" },
        configNamespace = "typescript",
      }

      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              checkThirdParty = false,
            },
          },
        },
      })

      vim.lsp.config("html", {
        capabilities = capabilities,
      })

      vim.lsp.config("cssls", {
        capabilities = capabilities,
      })

      vim.lsp.config("jsonls", {
        capabilities = capabilities,
      })

      vim.lsp.config("yamlls", {
        capabilities = capabilities,
      })

      vim.lsp.config("bashls", {
        capabilities = capabilities,
      })

      vim.lsp.config("emmet_language_server", {
        capabilities = capabilities,
      })

      vim.lsp.config("tailwindcss", {
        capabilities = capabilities,
      })

      vim.lsp.config("vtsls", {
        capabilities = capabilities,
        filetypes = {
          "javascript",
          "javascriptreact",
          "javascript.jsx",
          "typescript",
          "typescriptreact",
          "typescript.tsx",
          "vue",
        },
        settings = {
          vtsls = {
            tsserver = {
              globalPlugins = {
                vue_plugin,
              },
            },
          },
        },
      })

      vim.lsp.config("vue_ls", {
        capabilities = capabilities,
      })

      vim.lsp.enable({
        "lua_ls",
        "html",
        "cssls",
        "jsonls",
        "yamlls",
        "bashls",
        "emmet_language_server",
        "tailwindcss",
        "vtsls",
        "vue_ls",
      })
    end,
  },
}
