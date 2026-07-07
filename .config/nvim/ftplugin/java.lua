-- Per-buffer jdtls startup. Runs on every `java` filetype buffer.
-- Guards so it silently no-ops until nvim-jdtls and the mason jdtls package
-- are installed (run :Mason / :MasonToolsInstall to finish the download).
local ok, jdtls = pcall(require, "jdtls")
if not ok then
	return
end

local mason = vim.fn.stdpath("data") .. "/mason/packages"
local jdtls_dir = mason .. "/jdtls"
local launcher = vim.fn.glob(jdtls_dir .. "/plugins/org.eclipse.equinox.launcher_*.jar")
if launcher == "" then
	return -- jdtls not installed yet
end

-- OS-specific jdtls config dir
local sysname = vim.uv.os_uname().sysname
local os_config = (sysname == "Darwin" and "config_mac")
	or (sysname:match("Windows") and "config_win")
	or "config_linux"

-- One workspace per project root (Gradle / Maven / git).
local root = vim.fs.root(0, {
	"gradlew",
	"mvnw",
	"settings.gradle",
	"settings.gradle.kts",
	"build.gradle",
	"build.gradle.kts",
	"pom.xml",
	".git",
})
if not root then
	return
end
local workspace = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. vim.fn.fnamemodify(root, ":p:h:t")

-- Optional DAP + test bundles (loaded only if those mason packages exist).
local bundles = {}
vim.list_extend(
	bundles,
	vim.split(vim.fn.glob(mason .. "/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar", true), "\n")
)
vim.list_extend(bundles, vim.split(vim.fn.glob(mason .. "/java-test/extension/server/*.jar", true), "\n"))
bundles = vim.tbl_filter(function(v)
	return v ~= ""
end, bundles)

local config = {
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xmx1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",
		"-jar",
		launcher,
		"-configuration",
		jdtls_dir .. "/" .. os_config,
		"-data",
		workspace,
	},
	root_dir = root,
	init_options = { bundles = bundles },
	settings = {
		java = {
			-- How jdtls imports the Gradle build.
			import = {
				gradle = {
					enabled = true,
					wrapper = { enabled = true }, -- build with the project's ./gradlew
				},
			},
			-- "interactive" prompts to re-import when build.gradle changes;
			-- switch to "automatic" to reload dependencies without prompting.
			configuration = { updateBuildConfiguration = "interactive" },
			-- Jump into dependency source instead of stubs.
			eclipse = { downloadSources = true },
			maven = { downloadSources = true },
			references = { includeDecompiledSources = true },
			signatureHelp = { enabled = true },
			completion = { importOrder = { "java", "javax", "com", "org" } },
		},
	},
	on_attach = function(_, bufnr)
		local map = function(lhs, rhs, desc)
			vim.keymap.set("n", lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
		end
		-- Java-namespaced keymaps (avoid clobbering neotest's <leader>t*).
		map("<leader>jo", jdtls.organize_imports, "Java: organize imports")
		map("<leader>jv", jdtls.extract_variable, "Java: extract variable")
		map("<leader>jc", jdtls.extract_constant, "Java: extract constant")
		map("<leader>jt", jdtls.test_nearest_method, "Java: test nearest method")
		map("<leader>jT", jdtls.test_class, "Java: test class")
		vim.keymap.set("v", "<leader>jv", function()
			jdtls.extract_variable(true)
		end, { buffer = bufnr, desc = "Java: extract variable" })

		if #bundles > 0 then
			jdtls.setup_dap({ hotcodereplace = "auto" })
		end
	end,
}

-- General LSP keymaps + native completion still come from the shared
-- LspAttach autocmd in lua/plugins/lsp-config.lua.
jdtls.start_or_attach(config)
