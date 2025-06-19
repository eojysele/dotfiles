return {
	"mfussenegger/nvim-jdtls",
	config = function()
		local jdtls_callback = function()
			local jdtls = require("jdtls")

			local home_directory = os.getenv("HOME")
			local config_directory = home_directory .. "/.config/nvim"
			local runtimes_directory = os.getenv("SDKMAN_DIR") .. "/candidates/java"

			local jdtls_directory = home_directory .. "/.local/share/nvim/mason/packages/jdtls"

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

			local jdtls_runtime = runtimes_directory .. "/21.0.7-tem/bin/java"

			local formatter_settings = {
				url = config_directory .. "/java-google-style.xml",
				profile = "GoogleStyle",
			}

			local import_order = {
				"java",
				"javax",
				"jakarta",
				"org",
				"com",
				"",
				"#",
			}

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local config = {
				flags = {
					debounce_text_changes = 80,
				},
				on_attach = function()
					require("eojysele.core.keymaps").jdtls_keymaps()
				end,
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
							importOrder = import_order,
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
							settings = formatter_settings,
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
									path = runtimes_directory .. "/21.0.7-tem",
									default = true,
								},
								{
									name = "JavaSE-17",
									path = runtimes_directory .. "/17.0.15-tem",
								},
								{
									name = "JavaSE-11",
									path = runtimes_directory .. "/11.0.27-tem",
								},
							},
						},
					},
				},
				cmd = {
					jdtls_runtime,
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
					"-javaagent:" .. lombok_file,
					"-jar",
					vim.fn.glob(jdtls_file),
					"-configuration",
					jdtls_config_directory,
					"-data",
					workspace_directory,
				},
			}

			jdtls.start_or_attach(config)
		end

		local autocmd = vim.api.nvim_create_autocmd
		autocmd("FileType", {
			pattern = "java",
			callback = jdtls_callback,
		})
	end,
}
