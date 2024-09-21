local status, lsp_signature = pcall(require, "lsp_signature")

if not status then  -- The plugin is not existed
    return
end

--require'lspconfig'.gopls.setup{}

lsp_signature.setup({
    wrap = true,
    floating_window = true,
    floating_window_above_cur_line = true,
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
      border = "rounded"
    }
})
