local JDTLS_CONFIG

local jdtls = require('jdtls')

local file_utils = require("eojysele.utils.file")
local home = os.getenv('HOME')
local runtimes_home = os.getenv("SDKMAN_DIR") .. "/candidates/java"
local nvim_home = vim.fn.stdpath('data')

local jdtls_home = nvim_home .. "/mason/packages/jdtls"
local jdtls_config_home = jdtls_home .. "/config_mac"
local jdtls_plugins_home = jdtls_home .. "/plugins"
local jdtls_file = jdtls_plugins_home .. "/org.eclipse.equinox.launcher_*.jar"
local jdtls_runtime = runtimes_home .. "/21.0.2-tem/bin/java"

local lombok_file = jdtls_home .. "/lombok.jar"
local root_markers = { 'gradlew', 'mvnw', '.git' }
local project_home = require('jdtls.setup').find_root(root_markers)
local workspace_home = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(project_home, ":p:h:t")

local runtimes = {
    {
        name = "JavaSE-21",
        path = runtimes_home .. "/21.0.2-tem"

    },
    {
        name = "JavaSE-17",
        path = runtimes_home .. "/17.0.10-tem",
        default = true
    },
    {
        name = "JavaSE-11",
        path = runtimes_home .. "/11.0.22-tem"

    }
}

-- default formatter
local formatter_settings = {
    url = home .. "/.local/share/eclipse/.nvim/eclipse-java-style.xml",
    profile = "EJStyle",
}

-- default import order
local import_order = {
    "java",
    "javax",
    "jakarta",
    ""
}

-- project settings
if project_home ~= nil then
    -- formatter
    local formatter_file = project_home .. "/.nvim/eclipse-java-style.xml"
    local formatter_name = "ProjectStyle"
    if file_utils.file_is_exists(formatter_file) then
        formatter_settings = {
            url = formatter_file,
            profile = formatter_name,
        }
    end

    -- import order
    local import_order_file = project_home .. "/.nvim/import-order.lua"
    if file_utils.file_is_exists(import_order_file) then
        local load_project_import_order = assert(loadfile(import_order_file))
        local project_import_order = load_project_import_order()
        if project_import_order ~= nil then
            import_order = project_import_order
        end
    end
end

local on_attach = function(client, bufnr)
    require("eojysele.keymaps").java_keymaps(bufnr, jdtls);
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

JDTLS_CONFIG = {
    flags = {
        debounce_text_changes = 80,
    },
    capabilities = capabilities,
    on_attach = on_attach,
    root_dir = project_home,
    settings = {
        java = {
            eclipse = {
                downloadSources = true,
            },
            maven = {
                downloadSources = true,
            },
            implementationsCodeLens = {
                enabled = true,
            },
            referencesCodeLens = {
                enabled = true,
            },
            rename = {
                enabled = true
            },
            references = {
                includeDecompiledSources = true,
            },
            signatureHelp = {
                enabled = true
            },
            contentProvider = {
                preferred = 'fernflower'
            },
            sources = {
                organizeImports = {
                    starThreshold = 9999,
                    staticStarThreshold = 9999,
                },
            },
            completion = {
                importOrder = import_order
            },
            codeGeneration = {
                toString = {
                    template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
                },
                hashCodeEquals = {
                    useJava7Objects = true,
                },
                useBlocks = true,
            },
            format = {
                settings = formatter_settings,
            },
            configuration = {
                runtimes = runtimes
            }
        }
    },
    cmd = {
        jdtls_runtime,
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xmx4g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
        '-javaagent:' .. lombok_file,
        '-jar', vim.fn.glob(jdtls_file),
        '-configuration', jdtls_config_home,
        '-data', workspace_home,
    },
}

return JDTLS_CONFIG
