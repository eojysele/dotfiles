local mason = require("mason")
local masonLspconfig = require("mason-lspconfig")

mason.setup()
masonLspconfig.setup()

-- Auto install mason packages
local masonRegistry = require("mason-registry")

local requiredPackages = {
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

local requiredPackagesName = ""

for _, requiredPackage in ipairs(requiredPackages) do
    if masonRegistry.is_installed(requiredPackage) == false then
        masonRegistry.get_package(requiredPackage):install()
        requiredPackagesName = requiredPackagesName .. requiredPackage .. " "
    end
end

if requiredPackagesName ~= "" then
    print("[Mason] Installing packages: " .. requiredPackagesName)
end
