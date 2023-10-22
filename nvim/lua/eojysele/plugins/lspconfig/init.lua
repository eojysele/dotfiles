local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Markdown
require 'lspconfig'.marksman.setup {
    capabilities = capabilities,
}

-- Lua
require 'lspconfig'.lua_ls.setup {
    capabilities = capabilities,
}

-- HTML
require 'lspconfig'.html.setup {
    capabilities = capabilities,
}

-- JSON
require 'lspconfig'.jsonls.setup {
    capabilities = capabilities,
}

-- XML
require 'lspconfig'.lemminx.setup {
    capabilities = capabilities,
}

-- YAML
require 'lspconfig'.yamlls.setup {
    filetypes = { "yaml" },
    settings = {
        redhat = {
            telemetry = {
                enabled = false
            }
        }
    }
}

-- Docker compose
require 'lspconfig'.docker_compose_language_service.setup {
    filetypes = { "yaml.docker-compose" }
}

-- Dockerfile
require 'lspconfig'.dockerls.setup {}
