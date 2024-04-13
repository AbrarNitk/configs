return {
  "simrat39/rust-tools.nvim",
  dependencies = {
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
  },
  ft = "rust",
  config = function()
    local rt = require("rust-tools")
    rt.setup({
      server = {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        on_attach = function(_, bufnr)
          vim.keymap.set("n", "<Leader>k", rt.hover_actions.hover_actions, { buffer = bufnr })
          vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
        end,
      },
      tools = {
        hover_actions = {
          auto_focus = true,
          border = {
            { "╭", "FloatBorder" },
            { "─", "FloatBorder" },
            { "╮", "FloatBorder" },
            { "│", "FloatBorder" },
            { "╯", "FloatBorder" },
            { "─", "FloatBorder" },
            { "╰", "FloatBorder" },
            { "│", "FloatBorder" },
          },
        },
        -- automatically call RustReloadWorkspace when writing to a Cargo.toml file.
        reload_workspace_from_cargo_toml = true,
        inlay_hints = {
          auto = true,
          highlight = "Comment",
        },
        -- debugging stuff
        -- dap = {
        --   adapter = {
        --     type = "executable",
        --     command = "lldb-vscode",
        --     name = "rt_lldb",
        --   },
        -- },
      },
    })
  end,
}
