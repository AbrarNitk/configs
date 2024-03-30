-- Docs: https://microsoft.github.io/language-server-protocol/
-- LspConfig Repo: https://github.com/neovim/nvim-lspconfig
-- :help lsp


return {
  {
    "neovim/nvim-lspconfig",
    event = {"BufReadPost"},
    cmd = {"LspInfo", "LspInstall", "LspUninstall", "Mason"},
    dependencies = {
      -- Plugin(s) and UI to automatically install LSPs to stdpath
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      -- Install lsp autocompletions
			--"hrsh7th/cmp-nvim-lsp",

      -- Progress/Status update for LSP
			{ "j-hui/fidget.nvim", opts = {} },
    },
    config = function()
      -- local map_lsp_keybinds = require("user.keymaps").map_lsp_key_binds
    end,
  },
  {
    -- https://github.com/stevearc/conform.nvim
    -- Lightweight yet powerful formatter plugin for Neovim
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
      notify_on_error = true,
      format_on_save = {
        async = true,
        timeout_ms = 500,
        lsp_fallback = true
      },
      formatters_by_ft = {
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        python = { "isort", "black" },
        javascript = { { "prettierd", "prettier" } },
        typescript = { { "prettierd", "prettier" } },
        typescriptreact = { { "prettierd", "prettier" } },
      }
    }
  }
}
