local status, lspconfig = pcall(require, "lspconfig")

if not status then  -- The plugin is not existed
    return
end

lspconfig.clangd.setup{}
lspconfig.pyright.setup{}
