local global = vim.g

-- map <leader> to <space> key

global.mapleader = " "
global.maplocalleader = " "

-- Edit option

vim.o.number = true -- 显示行号
vim.o.mouse = "a" -- 启用鼠标
vim.o.selection = "exclusive"
vim.o.selectmode = "mouse,key"
-- 设置编码
vim.o.fileencodings = "utf-8,ucs-bom,gb1800,gbk,gb2312,cp936"  -- 写入文件时采用的编码
--vim.o.termencoding = "utf-8"  -- 输出到终端时采用的编码类型，neovim的高版本没有这个设置
vim.o.encoding = "utf-8"  -- 用于缓存的文本、寄存器等
-- 设置编码
vim.o.cursorline = true -- 突出显示当前行

vim.o.syntax = "on" -- on  off 语法检测,,颜色显示
vim.o.hlsearch = true -- 若查找到匹配的短语(字符串),则高亮显示,,默认就是true，默认是开启的

------  制表符 ------
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4  -- 在编辑模式，按退格键 退回缩进的长度
------  制表符 ------

vim.o.autoindent = true -- 自动缩进
vim.o.cindent = true-- 针对C语言语法 自动缩进
vim.o.smartindent = true  -- 根据文件中其他地方的缩进空格数来确定一个tab是多少个空格
vim.o.showcmd = true
vim.o.showmode = true
vim.o.cmdheight = 1 -- 设置底部命令行的高度
vim.o.list = true -- 显示空格、换行
vim.o.listchars = "tab:>-,trail:-"  -- 修改tab的显示符号
vim.o.ruler = true -- 在最下面一行显示状态,,默认就是true
vim.o.filetype = "on" -- 检测文件类型
vim.o.history = 1000 -- 记录历史命令的行数
vim.o.foldmethod = "manual"  -- 设置代码折叠方式,,共6中方式
--vim.o.clipboard = "unnamedplus"  -- 让vim使用系统剪贴板
vim.o.wildmenu = true  -- 提示框
vim.o.ttimeoutlen = 0  -- Esc键 延迟

vim.o.termguicolors = true  -- 24-bit-color

vim.o.title = true
vim.o.inccommand = "split"  -- nosplit split
vim.o.splitright = true  -- :vsp向右分屏
vim.o.splitbelow = true  -- :sp向下分屏

------ 文档备份设置 -------
vim.opt.backup = false  -- 不自动备份
vim.opt.writebackup = false
------ 文档备份设置 -------

vim.opt.filetype = "on"  -- check file type

--vim.opt.spell = true  -- 拼写检查
--vim.opt.spelllang = {"en_us","cjk"}  -- 只接受美式拼法,不对中文报错;;默认值是en

vim.o.completeopt = "preview,menuone"
--vim.o.popupmenu = true
vim.o.complete = ".,w,b,u,t,i"
