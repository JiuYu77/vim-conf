" <leader>键 默认是 \，反斜杠"
let mapleader=" " "将 leader键 重新映射为空格

"在vim中加入文件署名和时间, 快捷键 <F2>
nnoremap <F2> ms:call AddAuthor()<cr>'s
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
    execute '/* Last modified\s*:/s@:.*$@\=strftime(": %Y-%m-%d %H:%M:%S")@'
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
    call append(3,"* Last modified : ".strftime("%Y-%m-%d %H:%M:%S"))
    call append(4,"* Filename      : ".expand("%:t"))
    call append(5,"* Description   : ")
    call append(6,"**********************************************************/")
    echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endfunction


" Toggle Quickfix window with <F3>
nnoremap <F3> :call ToggleQuickfix()<CR>
function! ToggleQuickfix()
  let l:quickfix_open = 0
  for win in range(1, winnr('$'))
    if getwinvar(win, '&buftype') ==# 'quickfix'
      let l:quickfix_open = 1
      break
    endif
  endfor
  if l:quickfix_open
    cclose
  else
    copen
  endif
endfunction


"compile c c++ file in quickfix  makeprg
nmap <F4> :call DoOneFileMake()<CR>
function DoOneFileMake()
    if(expand("%:p:h")!=getcwd())
        echohl WarningMsg | echo "Fail to make! This file is not in the current dir! Press redirect to the dir of this file."
    endif
    "exec "w"
	call SetCompilation()

endfunction
function SetCompilation()
    if !empty(globpath(&runtimepath, 'plugin/asyncrun.vim'))
        if &filetype=='c'
            AsyncRun gcc % -o %< && ./%<
        elseif &filetype=='cpp'
            AsyncRun g++ % -o %<
        elseif &filetype=='python'
            AsyncRun python3 %
        endif
    else
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
    endif
endfunction


" asyncrun.vim  <F5>
nnoremap <F5> :AsyncRun


"******************************************************************************************"
" buffer 缓冲区
" buffers
" buffer    buf
" bnext bn 和 bprevious bp
" bfirst bf 和 blast bl
" bdelete   bd
" bwipeout  bwipe
nnoremap <Leader>b :bn<CR>
nnoremap bd :bd<CR>

"******************************************************************************************"
"终端 term  terminal
"水平term, 20 行
nnoremap tt :terminal ++rows=20<CR>
"垂直term, 100 列
nnoremap vt :vertical terminal ++cols=100<CR>


