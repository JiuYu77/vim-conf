local status, notify = pcall(require, "notify")

if not status then  -- The plugin is not existed
    return
end


local plugin = "My Awesome Plugin"
notify.setup({
    background_colour = "#F70067",
    --background_colour = "#000000",
    title = "My Awesome Plugin",
    render = "default"
})

--notify.history()
notify("My super important message")

vim.notify = notify  -- vim.notify = require("notify")
--vim.notify("This is an error massage", "error")  -- use to test
