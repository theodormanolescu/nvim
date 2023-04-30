local status_ok, mason = pcall(require, "mason")
if not status_ok then
    return
end
local status_ok_1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_1 then
    return
end

local servers = {
    "lua_ls",
    "pyright",
    "intelephense",
    "rust_analyzer",
    "taplo",
    "groovyls"
}

local settings = {
    ui = { border = "rounded" },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
}

mason.setup(settings)
mason_lspconfig.setup({
    ensure_installed = servers,
    automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    return
end

local opts = {}

for _, server in pairs(servers) do
    opts = {
        on_attach = require("tm.plugins.lsp.handlers").on_attach,
        capabilities = require("tm.plugins.lsp.handlers").capabilities,
    }

    if server == "lua_ls" then
        local sumneko_opts = require("tm.plugins.lsp.settings.lua_ls")
        opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
    end

    if server == "pyright" then
        local pyright_opts = require("tm.plugins.lsp.settings.pyright")
        opts = vim.tbl_deep_extend("force", pyright_opts, opts)
    end
    if server == "rust_analyzer" then
        local rust_opts = require("tm.plugins.lsp.settings.rust")
        local rust_tools_status_ok, rust_tools = pcall(require, "rust-tools")
        if not rust_tools_status_ok then
            return
        end

        rust_tools.setup(rust_opts)
        goto continue
    end
    lspconfig[server].setup(opts)
    ::continue::
end
