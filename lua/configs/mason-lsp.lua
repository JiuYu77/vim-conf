local status, mason_lsp = pcall(require, "mason-lspconfig")

if not status then  -- The plugin is not existed
    return
end

mason_lsp.setup({
    --automatic_installation = false,
    ensure_installed = {
        "clangd",
        "pyright",
    }
})
