"------------------------------------------------------------------------------------------"
"Vim9新增
" 菜单，vim9以下版本需注释下面一行
set wildoptions=pum
" 菜单，vim9以下版本需注释下面一行
set smoothscroll
" 拼写检查z=  编辑文件的时候，按下Esc键，直接使用

"------------------------------------------------------------------------------------------"
" ctrl+p 前一个，ctrl+n 后一个，ctrl+y确认，ctrl+e取消补全
" <leader>键默认是 \，反斜杠"
let mapleader=" " "将leader键重新映射为空格

"------------------------------------------------------------------------------------------"
" source 加载其他配置文件
source ~/.vim/vim-plugin.conf

"******************************************************************************************"
" buffer 缓冲区
" buffers
" buffer    buf
" bnext bn 和 bprevious bp
" bfirst bf 和 blast bl
" bdelete   bd
" bwipeout  bwipe
nmap <Leader>b :bn<CR>
nmap bd :bd<CR>

"******************************************************************************************"
"终端 term  terminal
nmap tt :terminal ++rows=20<CR> "水平term, 20 行
nmap vt :vertical terminal ++cols=100<CR> "垂直term, 100 列


" 分割出的新窗口的位置。包括终端位置
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

"compile c c++ file in quickfix  makeprg
nmap <F4> :call DoOneFileMake()<CR>
function DoOneFileMake()
    if(expand("%:p:h")!=getcwd())
        echohl WarningMsg | echo "Fail to make! This file is not in the current dir! Press redirect to the dir of this file."
    endif
    exec "w"
	call SetCompilation()

endfunction
function SetCompilation()
    if &filetype=='c'
        set makeprg=gcc\ %\ -o\ %<
		exec "make"
		exec '!time ./%<'
		exec "copen"
    elseif &filetype=='cpp'
        set makeprg=g++\ %\ -o\ %<
		exec "make"
		exec '!time ./%<'
		exec "copen"
    elseif &filetype=='python'
		exec "!time python3 %"
    endif
endfunction

" F3 关闭quickfix窗口
nnoremap <F3> :cclose<CR>
" F5 设置为:w :make :copen快捷键, 保存文件(加上:w操作，会有问题，所以去掉了)-->编译程序,执行Makefile文件-->打开Quickfix查看相关信息
nmap  <F5> :make<CR><CR><CR>:copen<CR>
" 运行程序
nmap <F6> :make run<CR><CR><cr>:copen<cr>

"******************************************************************************************"
"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
"在vim中加入文件署名和时间,,快捷键 <F2>
map <F2> ms:call AddAuthor()<cr>'s
function AddAuthor()
    let n=1
    while n < 5
        let line = getline(n)
        if line =~'^\s*\*\s*\S*Last\s*modified\s*:\s*\S*.*$'
            call UpdateTitle()
            return
        endif
        let n = n + 1
    endwhile
    call AddTitle()
endfunction

function UpdateTitle()
    normal m'
    execute '/* Last modified\s*:/s@:.*$@\=strftime(": %Y-%m-%d %H:%M")@'
    normal "
    normal mk
    execute '/* Filename\s*:/s@:.*$@\=": ".expand("%:t")@'
    execute "noh"
    normal 'k
    echohl WarningMsg | echo "Successful in updating the copy right." | echohl None
endfunction

function AddTitle()
    call append(0,"/**********************************************************")
    call append(1,"* Author        : 名字")
    call append(2,"* Email         : 邮箱")
    call append(3,"* Last modified : ".strftime("%Y-%m-%d %H:%M"))
    call append(4,"* Filename      : ".expand("%:t"))
    call append(5,"* Description   : ")
    call append(6,"**********************************************************/")
    echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endfunction
"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"

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
" 在保存文件时自动删除尾部空格
autocmd BufWritePre * %s/\s\+$//e


"启用鼠标"
set mouse=a
set selection=exclusive
set selectmode=mouse,key


"显示括号匹配"
set showmatch


"设置Tab制表符长度为4个空格"
set tabstop=4
"设置自动缩进长度为4空格"
set shiftwidth=4
"软制表符宽度为4"
set softtabstop=4

"设置缩进"
"自动缩进,继承前一行的缩进方式，适用于多行注释"
set autoindent
"自动缩进，可能是set autoindent的缩写
"set ai

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

"自动语法高亮 syntax on和 syntax enable功能相同，只是syntax enable稍微优先"
syntax on
"高亮显示所有的匹配短语
set hlsearch

"折叠设置; 符号: + 和 -; 可通过“鼠标”进行展开 或 折叠
set foldenable
"set nofoldenable "禁用代码折叠
set foldmethod=manual
set foldcolumn=1


"*****************************************************************
" 仅对指定文件格式设置自动补全功能
autocmd FileType c,cpp,sh,java,html,js,css,python exec AutoComplete()
"自动补全括号，双引号，单引号
func! AutoComplete()
    "相关映射
    :inoremap ( ()<Left>
    :inoremap ) <c-r>=ClosePair(')')<CR>
    :inoremap { {}<Left>
    :inoremap } <c-r>=ClosePair('}')<CR>
    :inoremap [ []<Left>
    :inoremap ] <c-r>=ClosePair(']')<CR>
    :inoremap " <c-r>=DQuote()<CR>
    :inoremap ' <c-r>=SQuote()<CR>
	" 将BackSpace键映射为RemovePairs函数
    :inoremap <BS> <c-r>=RemovePairs()<CR>
	" 将回车键映射为BracketIndent函数
	:inoremap <CR> <c-r>=BracketIndent()<CR>
endfunc

func! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunc

"自动补全双引号
func! DQuote()
    if getline('.')[col('.') - 1] == '"'
        return "\<Right>"
    else
		if getline('.')[col('.') - 2] == '"'
			return '"'
		else
			return "\"\"\<Left>"
    endif
endfunc
"自动补全单引号
func! SQuote()
    if getline('.')[col('.') - 1] == "'"
        return "\<Right>"
    else
		if getline('.')[col('.') - 2] == "'"
			return "'"
		else
			return "''\<Left>"
    endif
endfunc

" 按BackSpace键时判断当前字符和前一字符是否为括号对或一对引号，如果是则两者均删除，并保留BackSpace正常功能
func! RemovePairs()
	let l:line = getline(".") " 取得当前行
	let l:current_char = l:line[col(".")-1] " 取得当前光标字符
	let l:previous_char = l:line[col(".")-2] " 取得光标前一个字符

	if (l:previous_char == '"' || l:previous_char == "'") && l:previous_char == l:current_char
		return "\<delete>\<bs>"
	elseif index(["(", "[", "{"], l:previous_char) != -1
		" 将光标定位到前括号上并取得它的索引值
		execute "normal! h"
		let l:front_col = col(".")
		" 将光标定位到后括号上并取得它的行和索引值
		execute "normal! %"
		let l:line1 = getline(".")
		let l:back_col = col(".")
		" 将光标重新定位到前括号上
		execute "normal! %"
		" 当行相同且后括号的索引比前括号大1则匹配成功
		if l:line1 == l:line && l:back_col == l:front_col + 1
			return "\<right>\<delete>\<bs>"
		else
			return "\<right>\<bs>"
		end
	else
		return "\<bs>"
	end
endfunc

" 在大括号内换行时进行缩进
func! BracketIndent()
	let l:line = getline(".")
	let l:current_char = l:line[col(".")-1]
	let l:previous_char = l:line[col(".")-2]

	if l:previous_char == "{" && l:current_char == "}"
		return "\<cr>\<esc>\ko"
	else
		return "\<cr>"
	end
endfunc


"自动提示,preview:是默认值，会自动选择第一个提示词；noselect:不自动选择第一个提示词
"set completeopt=preview,menu
"上面一句是Vim的默认设置,不用添加，如果要使用noselect则要添加这一句，并将preview改为noselect

