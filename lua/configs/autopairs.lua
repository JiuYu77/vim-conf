local status, autopairs = pcall(require, "nvim-autopairs")

if status then
    autopairs.setup()
end
