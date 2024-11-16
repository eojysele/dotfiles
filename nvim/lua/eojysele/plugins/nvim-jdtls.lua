local options = {
	jdtls_runtime = nil,
	jdtls_config_directory = nil,
	jdtls_file = nil,
	lombok_file = nil,
	workspace_directory = nil,
	runtimes_directory = nil,
	formatter_settings = nil,
	import_order = nil,
	project_directory = nil,
}

local required_keys = {
	"jdtls_runtime",
	"jdtls_config_directory",
	"jdtls_file",
	"lombok_file",
	"workspace_directory",
	"runtimes_directory",
	"formatter_settings",
	"import_order",
	"project_directory",
}

local function check_required_options()
	for _, key in ipairs(required_keys) do
		if options[key] == nil then
			local message = "JDTLS: undefined options - " .. key
			print(message)
			error(message)
		end
	end
end

local function init_options()
	local home_directory = os.getenv("HOME")
	local config_directory = home_directory .. "/.config/nvim"
	local runtimes_directory = os.getenv("SDKMAN_DIR") .. "/candidates/java"

	local mason_registry = require("mason-registry")
	local jdtls_directory = mason_registry.get_package("jdtls"):get_install_path()

	local jdtls_config_directory
	if vim.loop.os_uname().sysname == "Darwin" then
		jdtls_config_directory = jdtls_directory .. "/config_mac"
	else
		jdtls_config_directory = jdtls_directory .. "/config_linux"
	end

	local jdtls_file = jdtls_directory .. "/plugins/org.eclipse.equinox.launcher_*.jar"
	local lombok_file = jdtls_directory .. "/lombok.jar"

	local root_markers = { ".git" }
	local project_directory = require("jdtls.setup").find_root(root_markers)

	local workspace_directory = home_directory
		.. "/.local/share/eclipse/"
		.. vim.fn.fnamemodify(project_directory, ":p:h:t")

	local jdtls_runtime = runtimes_directory .. "/21.0.5-tem/bin/java"

	-- default formatter
	local formatter_settings = {
		url = config_directory .. "/java-google-style.xml",
		profile = "GoogleStyle",
	}

	-- default import order
	local import_order = {
		"java",
		"javax",
		"jakarta",
		"org",
		"com",
		"",
		"#",
	}

	local file_utils = require("eojysele.core.utils.file")

	-- project settings
	if project_directory ~= nil then
		-- formatter
		local formatter_file = project_directory .. "/.nvim/eclipse-java-style.xml"
		local formatter_name = "ProjectCodeStyle"
		if file_utils.file_is_exists(formatter_file) then
			formatter_settings = {
				url = formatter_file,
				profile = formatter_name,
			}
		end

		-- import order
		local import_order_file = project_directory .. "/.nvim/import-order.lua"
		if file_utils.file_is_exists(import_order_file) then
			local load_project_import_order = assert(loadfile(import_order_file))
			local project_import_order = load_project_import_order()
			if project_import_order ~= nil then
				import_order = project_import_order
			end
		end
	end

	options.jdtls_runtime = jdtls_runtime
	options.jdtls_config_directory = jdtls_config_directory
	options.jdtls_file = jdtls_file
	options.lombok_file = lombok_file
	options.workspace_directory = workspace_directory
	options.runtimes_directory = runtimes_directory
	options.formatter_settings = formatter_settings
	options.import_order = import_order
	options.project_directory = project_directory
end

local function get_flags()
	return {
		debounce_text_changes = 80,
	}
end

local function on_attach(_, bufnr)
	local jdtls = require("jdtls")
	require("eojysele.core.keymaps").jdtls_keymaps(jdtls)
end

local function get_capabilities()
	local capabilities = require("cmp_nvim_lsp").default_capabilities()

	return capabilities
end

local function get_settings()
	return {
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
				enabled = true,
			},
			references = {
				includeDecompiledSources = true,
			},
			signatureHelp = {
				enabled = true,
			},
			contentProvider = {
				preferred = "fernflower",
			},
			sources = {
				organizeImports = {
					starThreshold = 9999,
					staticStarThreshold = 9999,
				},
			},
			completion = {
				importOrder = options.import_order,
			},
			codeGeneration = {
				toString = {
					template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
				},
				hashCodeEquals = {
					useJava7Objects = true,
				},
				useBlocks = true,
			},
			format = {
				settings = options.formatter_settings,
			},
			import = {
				gradle = {
					enabled = true,
					wrapper = {
						enabled = true,
					},
				},
				maven = {
					enabled = true,
				},
			},
			configuration = {
				runtimes = {
					{
						name = "JavaSE-21",
						path = options.runtimes_directory .. "/21.0.5-tem",
						default = true,
					},
					{
						name = "JavaSE-21",
						path = options.runtimes_directory .. "/21.0.5-librca",
					},
					{
						name = "JavaSE-17",
						path = options.runtimes_directory .. "/17.0.13-tem",
					},
					{
						name = "JavaSE-17",
						path = options.runtimes_directory .. "/17.0.13-librca",
					},
					{
						name = "JavaSE-11",
						path = options.runtimes_directory .. "/11.0.25-tem",
					},
					{
						name = "JavaSE-11",
						path = options.runtimes_directory .. "/11.0.25-librca",
					},
					{
						name = "JavaSE-1.8",
						path = options.runtimes_directory .. "/8.0.422-librca",
					},
				},
			},
		},
	}
end

local function get_cmd()
	return {
		options.jdtls_runtime,
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xmx4g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",
		"-javaagent:" .. options.lombok_file,
		"-jar",
		vim.fn.glob(options.jdtls_file),
		"-configuration",
		options.jdtls_config_directory,
		"-data",
		options.workspace_directory,
	}
end

local function jdtls_callback()
	local jdtls = require("jdtls")
	init_options()
	check_required_options()

	local config = {
		on_attach = on_attach,
		capabilities = get_capabilities(),
		flags = get_flags(),
		root_dir = options.project_directory,
		settings = get_settings(),
		cmd = get_cmd(),
	}

	jdtls.start_or_attach(config)
end

return {
	"mfussenegger/nvim-jdtls",
	config = function()
		local autocmd = vim.api.nvim_create_autocmd
		autocmd("FileType", {
			pattern = "java",
			callback = jdtls_callback,
		})
	end,
}
