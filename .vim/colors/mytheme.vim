"""
" 🎨 Vim 8色基础表（ANSI Colors 0–7）
" 颜色编号  颜色名称   显示颜色（可能因终端不同而略有变化）
"  0        Black       黑色
"  1        Red         红色
"  2        Green       绿色
"  3        Yellow      黄色（红+绿）
"  4        Blue        蓝色
"  5        Magenta     品红（红+蓝）
"  6        Cyan        青色（绿+蓝）
"  7        White       白色（通常是浅灰）
"
"  通过 ctermfg 设置
"""

" 256色 0-255   通过 ctermfg 设置

" 现代终端 支持 真彩色（True Color） 24-bit  通过 guifg 设置

let g:colors_name = "mytheme"

"注释
highlight Comment ctermfg=2 guifg=#198A2C

"函数名为黄色
hi Function ctermfg=yellow guifg=#dcdca6

"变量名为浅蓝
hi Identifier ctermfg=cyan guifg=#8cdcfe
"字符串
hi String ctermfg=yellow guifg=#ce9178

"类型名
"hi Type ctermfg=blue guifg=#1657ee
"常量
"hi Constant ctermfg=blue guifg=#1657ee
"关键字
"hi Keyword ctermfg=blue guifg=#1657ee

