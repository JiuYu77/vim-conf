"------------------------------------------------------------------------------------------"
"Vim9新增
" 菜单，vim9以下版本需注释下面一行
set wildoptions=pum

" 菜单，vim9以下版本需注释下面一行
set smoothscroll

" 拼写检查z=  编辑文件的时候，按下Esc键，直接使用

"------------------------------------------------------------------------------------------"
" ctrl+p 前一个，ctrl+n 后一个，ctrl+y确认，ctrl+e取消补全


"******************************************************************************************"
" buffer 缓冲区
" buffers
" buffer    buf
" bnext bn 和 bprevious bp
" bfirst bf 和 blast bl
" bdelete   bd
" bwipeout  bwipe


"******************************************************************************************"
"分割出的新窗口的位置。包括终端位置
set splitbelow "下方, 默认为上方
set splitright "右侧, 默认为左侧

"窗口高度和宽度
"set lines=54 "高度/行数
"set columns=20 "宽度/列数

"******************************************************************************************"
"Quickfix配置
"配置 quickfix 相关命令的快捷键. 可以用:map命令

"修改QuickFix窗口显示的最大条目数
let g:ctrlp_max_height = 15

"******************************************************************************************"

"设置编码"
set fileencodings=utf-8,ucs-bom,gb1800,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

"设置cmdheight"
set cmdheight=1

"显示行号"
set nu
"突出显示当前"
set cursorline

" 显示换行、空格
set list
"设置显示样式: eol(行尾)  tab(Tab键, 制表符)  trail(尾部空格)  extends(换行符)  precedes(换行符)
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

"启用鼠标"
set mouse=a
set selection=exclusive
set selectmode=mouse,key


"显示括号匹配"
set showmatch


"Tab
set tabstop=4      "设置Tab制表符长度为4个空格
set shiftwidth=4   "设置自动缩进长度为4空格
set softtabstop=4  "软制表符宽度为4 (Tab键插入 4空格)
set expandtab      "关键：将 Tab 转换为空格; 临时取消转换：set noexpandtab

"设置缩进"
set autoindent  "自动缩进,继承前一行的缩进方式，适用于多行注释"
"set ai          "自动缩进，可能是set autoindent的缩写

set cindent

"智能对齐方式"
set smartindent
"不自动储存备份文档"
set nobackup
"是否要显示--INSERT--之类的字眼在左下角的状态列"
set showmode

"不启动vi兼容模式"
set nocompatible
"设置backspace的工作方式
set backspace=indent,eol,start

"try :set paste to turn off it
set cin


"高亮显示所有的匹配短语
set hlsearch

"折叠设置; 符号: + 和 -; 可通过“鼠标”进行展开 或 折叠; za 展开，zc 折叠
set foldenable
"set nofoldenable "禁用代码折叠
set foldmethod=manual
set foldcolumn=1


"自动提示,preview:是默认值，会自动选择第一个提示词；noselect:不自动选择第一个提示词
"set completeopt=preview,menu
"上面一句是Vim的默认设置,不用添加，如果要使用noselect则要添加这一句，并将preview改为noselect


"自动语法高亮 syntax on 和 syntax enable 功能相同，只是syntax enable稍微优先"
syntax on

"------------------------------------------------------------------------------------------"
" source 加载其他配置文件
source ~/.vim/settings/map.vim
source ~/.vim/settings/ascii-picture.vim
source ~/.vim/settings/vim-plugin.vim
source ~/.vim/settings/autocmd.vim

"---- 自定义配色 ----
colorscheme mytheme


