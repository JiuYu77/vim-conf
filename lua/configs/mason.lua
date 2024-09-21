local status, mason = pcall(require, "mason")

if not status then  -- The plugin is not existed
    return
end

mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        },
        height = 0.7,  -- 0 to 1
        width = 0.6,
        --check_outdated_packages_on_open = true,
        border = "rounded",
    }
})
