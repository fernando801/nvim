return {
	"mfussenegger/nvim-jdtls",
	ft = { "java" },
	config = function()
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "java",
			callback = function()
				-- Anchor JDT LS at the repo/build root so Maven reactor projects import once.
				local root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" })
				if not root_dir then
					return
				end

				local project_name = vim.fn.fnamemodify(root_dir, ":t")
				local workspace_dir = "/Users/resen/.jdtls-workspace-root/" .. project_name
				local java_home = "/Library/Java/JavaVirtualMachines/jdk-21.jdk/Contents/Home"
				local mason_jdtls_dir = "/Users/resen/.local/share/nvim/mason/packages/jdtls"
				local lombok_jar = mason_jdtls_dir .. "/lombok.jar"
				local java_settings = {
					eclipse = {
						downloadSources = true,
					},
					maven = {
						downloadSources = true,
					},
				}
				local config = {
					-- The command that starts the language server
					-- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
					cmd = {

						-- 💀
						java_home .. "/bin/java", -- or '/path/to/java21_or_newer/bin/java'
						-- depends on if `java` is in your $PATH env variable and if it points to the right version.

						"-Declipse.application=org.eclipse.jdt.ls.core.id1",
						"-Dosgi.bundles.defaultStartLevel=4",
						"-Declipse.product=org.eclipse.jdt.ls.core.product",
						"-Dlog.protocol=true",
						"-Dlog.level=ALL",
						"-Xmx1g",
						"-javaagent:" .. lombok_jar,
						"--add-modules=ALL-SYSTEM",
						"--add-opens",
						"java.base/java.util=ALL-UNNAMED",
						"--add-opens",
						"java.base/java.lang=ALL-UNNAMED",

						-- 💀
						"-jar",
						"/Users/resen/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.7.100.v20251111-0406.jar",
						-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
						-- Must point to the                                                     Change this to
						-- eclipse.jdt.ls installation                                           the actual version

						-- 💀
						"-configuration",
						"/Users/resen/.local/share/nvim/mason/packages/jdtls/config_mac_arm",
						-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
						-- Must point to the                      Change to one of `linux`, `win` or `mac`
						-- eclipse.jdt.ls installation            Depending on your system.

						-- 💀
						-- See `data directory configuration` section in the README
						"-data",
						workspace_dir,
					},

					-- 💀
					-- This is the default if not provided, you can remove it. Or adjust as needed.
					-- One dedicated LSP server & client will be started per unique root_dir
					root_dir = root_dir,

					-- Here you can configure eclipse.jdt.ls specific settings
					-- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
					-- for a list of options
					settings = {
						java = java_settings,
					},

					-- Language server `initializationOptions`
					-- You need to extend the `bundles` with paths to jar files
					-- if you want to use additional eclipse.jdt.ls plugins.
					--
					-- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
					--
					-- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
					init_options = {
						bundles = {},
						settings = {
							java = java_settings,
						},
					},
				}
				-- This starts a new client & server,
				-- or attaches to an existing client & server depending on the `root_dir`.
				require("jdtls").start_or_attach(config)
			end,
		})
	end,
}
