-- Java LSP via nvim-jdtls (started per-project in ftplugin/java.lua).
-- jdtls itself is installed by mason but excluded from mason-lspconfig's
-- automatic_enable so this plugin is the single owner of the Java client.
-- Loaded eagerly (not ft-lazy) so require("jdtls") is always available by
-- the time ftplugin/java.lua runs on the first Java buffer. The module does
-- nothing until start_or_attach() is called, so the startup cost is trivial.
return {
	"mfussenegger/nvim-jdtls",
	lazy = false,
	dependencies = { "mfussenegger/nvim-dap" },
}
