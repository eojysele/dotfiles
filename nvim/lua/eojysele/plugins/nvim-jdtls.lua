return {
	"mfussenegger/nvim-jdtls",
	config = function()
		local jdtls_callback = function()
			local jdtls = require('jdtls')

			local home_directory = os.getenv('HOME')
			local dotfiles_directory = os.getenv('DOTFILES_HOME')
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

			local root_markers = { '.git' }
			local project_directory = require('jdtls.setup').find_root(root_markers)

			local workspace_directory = home_directory
				.. "/.local/share/eclipse/"
				.. vim.fn.fnamemodify(project_directory, ":p:h:t")

			local jdtls_runtime = runtimes_directory .. "/21.0.2-tem/bin/java"

			-- default formatter
			local formatter_settings = {
				url = dotfiles_directory .. "/style/java/eclipse-java-google-style.xml",
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
				"#"
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

			local capabilities = require('cmp_nvim_lsp').default_capabilities()

			local config = {
				flags = {
					debounce_text_changes = 80,
				},
				capabilities = capabilities,
				root_dir = project_directory,
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
									path = runtimes_directory .. "/21.0.2-tem"
								},
								{
									name = "JavaSE-17",
									path = runtimes_directory .. "/17.0.10-tem",
									default = true
								},
								{
									name = "JavaSE-11",
									path = runtimes_directory .. "/11.0.22-tem"
								}
							}
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
					'-configuration', jdtls_config_directory,
					'-data', workspace_directory,
				},
			}

			jdtls.start_or_attach(config)
		end

		local autocmd = vim.api.nvim_create_autocmd
		autocmd("FileType", {
			pattern = "java",
			callback = jdtls_callback,
		})
	end
}
