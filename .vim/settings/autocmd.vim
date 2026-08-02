" 保存时自动删除行尾空白（空格）
autocmd BufWritePre * %s/\s\+$//e

"*****************************************************************************
" 仅对指定文件格式设置自动补全功能
autocmd FileType c,cpp,sh,java,html,js,css,python exec AutoComplete()
"自动补 全括号，双引号，单引号
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

"*****************************************************************************
