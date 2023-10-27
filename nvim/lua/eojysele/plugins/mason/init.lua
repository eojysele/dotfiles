local mason = require("mason")
local masonLspconfig = require("mason-lspconfig")

mason.setup()
masonLspconfig.setup()

-- Auto install mason packages
local masonRegistry = require("mason-registry")

local listRequredPackages = {
    ----------------------------
    -- LSP servers -------------
    "jdtls",
    "lua-language-server",
    "html-lsp",
    "marksman",
    "lemminx",
    "json-lsp",
    "yaml-language-server",
    "dockerfile-language-server",
    ----------------------------
    -- DAP ---------------------
    "java-debug-adapter",
    "java-test"
}

local installedPackages = ""

for _, requredPackageName in ipairs(listRequredPackages) do
    if masonRegistry.is_installed(requredPackageName) == false then
        local packageToInstall = masonRegistry.get_package(requredPackageName)
        packageToInstall:install()
        installedPackages = installedPackages .. requredPackageName .. " "
    end
end

if installedPackages ~= "" then
    print("[Mason] Installing packages: " .. installedPackages)
end
