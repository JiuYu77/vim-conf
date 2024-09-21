local status, treesitter = pcall(require, "nvim-treesitter.configs")

if not status then  -- The plugin is not existed
    return
end

treesitter.setup({
    ensure_install = {"c", "cpp", "python", "lua"},
    auto_install = true,
    sync_install = false,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    }
})
