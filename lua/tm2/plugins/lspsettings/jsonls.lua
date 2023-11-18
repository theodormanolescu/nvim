local schemas = {
    {
        description = "TypeScript compiler configuration file",
        fileMatch = {
            "composer.json",
            "composer.*.json",
        },
        url = "https://getcomposer.org/schema.json",
    }
}

local extended_schemas = extend(schemas, require("schemastore").json.schemas())
local opts = {
    settings = {
        json = {
            schemas = extended_schemas,
            validate = { enable = true },
        },
    },
    setup = {
        commands = {
            Format = {
                function()
                    vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line "$", 0 })
                end,
            },
        },
    },
}

return opts
