local extension_path = vim.env.HOME .. "/.local/share/nvim/mason/"
local codelldb_path = extension_path .. "bin/codelldb"
local liblldb_path = extension_path .. "packages/codelldb/extension/lldb/lib/liblldb.so"

local opts = {
	tools = {
		on_initialized = function()
			vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "CursorHold", "InsertLeave" }, {
				pattern = { "*.rs" },
				callback = function()
					vim.lsp.codelens.refresh()
				end,
			})
		end,

		inlay_hints = {
			only_current_line = false,
			auto = true,
			only_current_line_autocmd = "CursorHold",
			show_parameter_hints = true,
			show_variable_name = false,
			parameter_hints_prefix = " ",
			other_hints_prefix = " ",
			max_len_align = false,
			max_len_align_padding = 1,
			right_align = false,
			right_align_padding = 7,
			highlight = "Comment",
		},
		hover_actions = {
			auto_focus = false,
			border = "rounded",
			width = 60,
		},
	},
	dap = {
		adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
	},
	server = {
		on_attach = require("tm.plugins.lsp.handlers").on_attach,
		capabilities = require("tm.plugins.lsp.handlers").capabilities,
		settings = {
			["rust-analyzer"] = {
				lens = {
					enable = true,
				},
				checkOnSave = {
					command = "clippy",
				},
				cargo = {
					autoreload = true,
				},
			},
		},
	},
}

return opts
