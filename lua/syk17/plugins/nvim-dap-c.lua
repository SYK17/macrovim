return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "williamboman/mason.nvim",
    "jay-babu/mason-nvim-dap.nvim",
    "rcarriga/nvim-dap-ui",  -- Add this dependency
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")  -- Require dap-ui
    dap.set_log_level('TRACE')

    -- Use mason-nvim-dap for automatic setup
    require("mason-nvim-dap").setup({
      ensure_installed = { "codelldb" },
      automatic_setup = true,
    })

    -- Adapter configuration
    dap.adapters.codelldb = {
      type = 'server',
      port = "${port}",
      executable = {
        command = vim.fn.stdpath("data") .. '/mason/bin/codelldb',
        args = {"--port", "${port}"},
      }
    }

    -- Configuration for C
    dap.configurations.c = {
      {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        env = {
          DYLD_LIBRARY_PATH = "/usr/local/lib:${DYLD_LIBRARY_PATH}"
        },
        args = {},
        runInTerminal = false,  -- Add this line
      },
    }

    -- Set up listeners to automatically open and close dapui when debugging starts/stops
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end
  end,
}
