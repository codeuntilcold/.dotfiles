return {
    "mfussenegger/nvim-dap",
	lazy = true,
    keys = {
        { "<leader>dd", ":DapContinue<CR>" },
        { "<leader>db", ":DapToggleBreakpoint<CR>" },
        { "<leader>do", ":DapStepOver<CR>" },
        { "<leader>dO", ":DapStepOut<CR>" },
        { "<leader>di", function() require("dap.ui.widgets").hover() end, desc = "[D]ap [I]nspect" },
    },
    -- if it is too much consider using mason-nvim-dap
    config = function()
        require("dap").adapters["pwa-node"] = {
            type = "server",
            host = "localhost",
            port = "${port}",
            executable = {
                command = "node",
                args = { vim.env.DEV_HOME .. "/js-debug/src/dapDebugServer.js", "${port}" },
            }
        }

        require("dap").configurations.typescript = {
            {
                type = "pwa-node",
                request = "attach",
                name = "Attach",
                cwd = vim.fn.getcwd(),
            },
        }
    end,
}
