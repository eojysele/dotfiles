local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")

-- Markdown
lspconfig.marksman.setup {}

-- Lua
lspconfig.lua_ls.setup {}

-- HTML
lspconfig.html.setup {
    capabilities = capabilities,
}

-- JSON
lspconfig.jsonls.setup {
    capabilities = capabilities,
}

-- XML
lspconfig.lemminx.setup {}

-- YAML
lspconfig.yamlls.setup {
    settings = {
        redhat = {
            telemetry = {
                enabled = false
            }
        }
    }
}

-- Dockerfile
lspconfig.dockerls.setup {}
