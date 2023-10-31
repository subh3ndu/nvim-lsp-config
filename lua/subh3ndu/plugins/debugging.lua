return {
	"rcarriga/nvim-dap-ui",
	event = "VeryLazy",
	dependency = {
		"mfussenegger/nvim-dap",
	},
	config = function()
		local dap = require("dap") -- fetch the dap plugin
		local dapui = require("dapui") -- Setup DapUI
		local api = require("nvim-tree.api")

		local keymap = vim.keymap

		dapui.setup()
		dap.listeners.after.event_initialized["dapui_config"] = function()
			api.tree.close()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
			api.tree.open()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
			api.tree.open()
		end

		-- nvim-dap keymappings
		keymap.set("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", {})
		keymap.set("n", "<leader>dr", "<cmd> DapContinue <CR>", {})

		dap.adapters.codelldb = {
			type = "server",
			host = "127.0.0.1",
			port = 13000,
			executable = {
				command = "/Users/subhendu/.codelldb/extension/adapter/codelldb",
				args = { "--port", "13000" },
			},
		}

		dap.configurations.cpp = {
			{
				name = "Launch File",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				args = { "<", "input.txt", ">", "output.txt" },
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				-- terminal = "integrated",
			},
		}
	end,
}
