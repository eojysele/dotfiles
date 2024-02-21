local JDTLS_CONFIG

local jdtls = require('jdtls')
local home = os.getenv('HOME')
local nvim_home = vim.fn.stdpath('data')
local jdtls_home = nvim_home .. "/mason/packages/jdtls"
local jdtls_config_home = jdtls_home .. "/config_mac"
local jdtls_plugins_home = jdtls_home .. "/plugins"
local jdtls_file = jdtls_plugins_home .. "/org.eclipse.equinox.launcher_*.jar"
local lombok_file = jdtls_home .. "/lombok.jar"
local root_markers = { 'gradlew', 'mvnw', '.git' }
local project_home = require('jdtls.setup').find_root(root_markers)
local workspace_home = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(project_home, ":p:h:t")

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
    "com",
    "org",
    ""
}

-- project settings
if project_home ~= nil then
    -- formatter
    local formatter_file = project_home .. "/.nvim/eclipse-java-style.xml"
    local formatter_name = "ProjectStyle"
    if vim.fn.filereadable(formatter_file) == 1 then
        formatter_settings = {
            url = formatter_file,
            profile = formatter_name,
        }
    end

    -- import order
    local import_order_file = project_home .. "/.nvim/import-order.lua"
    if vim.fn.filereadable(formatter_file) == 1 then
        local load_project_import_order = assert(loadfile())
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
                runtimes = {
                    {
                        name = "JavaSE-21",
                        path = "/Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home"
                    },
                    {
                        name = "JavaSE-17",
                        path = "/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home",
                        default = true
                    },
                    {
                        name = "JavaSE-11",
                        path = "/Library/Java/JavaVirtualMachines/temurin-11.jdk/Contents/Home"
                    }
                }
            }
        }
    },
    cmd = {
        '/Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home/bin/java',
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
