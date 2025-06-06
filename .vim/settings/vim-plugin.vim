" 插件及插件配置
call plug#begin('~/.vim/plugged')
Plug 'ghifarit53/tokyonight-vim'
Plug 'preservim/nerdtree'
Plug 'mhinz/vim-startify'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'tracyone/fzf-funky',{'on': 'FzfFunky'}
Plug 'easymotion/vim-easymotion'
Plug 'preservim/tagbar'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'dense-analysis/ale'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'skywind3000/asyncrun.vim'
"Plug 'honza/vim-snippets'
"Plug 'frazrepo/vim-rainbow' "会导致vim-devicons不正常
"Plug 'preservim/nerdcommenter'
call plug#end()

"******************************************************************************************"
"truecolor,开启24bit的颜色
set termguicolors

"tokyonight-vim主题
"available: night, storm
let g:tokyonight_style = 'storm'
let g:tokyonight_enable_italic = 1

colorscheme tokyonight "配色

let g:tokyonight_transparent_background = 1  "透明背景设置，1表示设置为透明 保持和 我的终端一样的颜色

"******************************************************************************************"
" ryanoasis/vim-devicons
let g:webdevicons_enable = 1 "1启用vim-devicons, 0禁用

let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1

"let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_conceal_nerdtree_brackets = 1

let g:webdevicons_enable_startify = 1


"******************************************************************************************"
"状态栏设置

set laststatus=2 "永远显示状态栏

"修改vim-airline的主题
let g:airline_theme='dark'
"let g:airline_theme='tokyonight'

""vim-airline和vim-airline-themes配置
let g:airline_powerline_fonts = 1  "支持 powerline 字体

let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_nr_show =  1
let g:airline#extensions#tabline#buffer_idx_mode=0
let g:airline#extensions#tabline#buffer_idx_format={
			\'0':'0',
			\'1':'1',
			\'2':'2',
			\'3':'3',
			\'4':'4',
			\'5':'5',
			\'6':'6',
			\'7':'7',
			\'8':'8',
			\'9':'9'
			\}

let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 1


"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep =  '|'
let g:airline#extensions#tabline#formatter = 'default'

let g:airline#extensions#keymap#enabled=1

let g:airline#extensions#branch#enabled=1

"let g:airline#extensions#tagbar#enabled=1

"let g:airline_skip_empty_sections=1

"修改符号
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
"let g:airline_left_sep = '▶'
"let g:airline_left_alt_sep = '❯'
"let g:airline_right_sep = '◀'
"let g:airline_right_alt_sep = '❮'
let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'

"******************************************************************************************"
"这行代码会判断在你退出主编辑窗口后，自动退出vim。退出vim时，自动关闭NERDTree、Quickfix等窗口。
autocmd BufEnter * if 0 == len(filter(range(1, winnr('$')), 'empty(getbufvar(winbufnr(v:val), "&bt"))')) | qa! | endif


"******************************************************************************************"
"NERDTree的配置,文件树
"设置宽度
let NERDTreeWinSize=30
" 显示行号
let NERDTreeShowLineNumbers=1
"打开NERDTree快捷键：ctrl+n
map <C-n> :NERDTreeToggle<CR>
"是否显示隐藏文件,1显示，0不显示
let NERDTreeShowHidden=0
""忽略以下文件的显示,'\.pyc','\~$','\.swp'
"let NERDTreeInore=['\.pyc','\~$','\.swp']
"let NERDTreeInore=['.pyc$','~$','.swp$']

"打开vim时，自动打开NERDTree
""autocmd vimenter * NERDTree

" vim启动打开目录时自动打开NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

"当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


"******************************************************************************************"
""vim-startify的配置
"可以使用:Startify重新打开起始页
"设置书签
let g:startify_bookmarks=[
			\'~/.vimrc',
			\]
"设置起始页显示的列表长度
let g:startify_files_number=20
"自动加载session
let g:startify_session_autoload=1
"过滤列表，支持正则表达式
let g:startify_skiplist=[
			\'^/tmp',
			\]
"可以自定义Header和Footer
let g:startify_custom_header=[
			\'^------------------------------------------------------^',
			\'|       Game is the game and can not be reality!       |',
			\'|                Still waters run deep!                |',
			\"| Don't say it can't be done;explain what can be done. |",
			\'*------------------------------------------------------*',
			\'      o',
			\'       o   ^__^',
			\'        o  (oo)\________',
			\'           (__)\        )\/\ ',
			\'               ||-----w |',
			\"               ||      ||",
			\]
let g:startify_custom_footer=[
			\'+--------------------------------+',
			\'|       Keep an open mind!       |',
			\'+--------------------------------+',
			\]

"******************************************************************************************"
"插件 fzf-funky: 配合 fzf在 文件里进行搜索的
"映射一下 leader fu
nnoremap <Leader>fu :FzfFunky<Cr>
"------------------------------------------------"
"插件 fzf 快速搜索文件,若显示fzf executable not found就根据提示下载binary版本
let $FZF_DELFAULT_COMMAND='find -L'
"1:Files [PATH]
"2:Ag [PATTERN]
"3.我的快捷键映射
"按 control + p 就可以快速搜索
nnoremap <Leader>f :Files<CR>
"按 control + g 可以快速全局模糊搜索（上面是只搜文件）
nnoremap <Leader>g :Ag<CR>

"******************************************************************************************"
"tagbar插件，用来在右侧展示 文件的整体结构视图 需要ctags
"设置 Control + u 作为映射快捷键
nmap <C-u> :TagbarToggle<CR>

"******************************************************************************************"
"ctags配置(好像不配置也能用)
"配置方法一
""set tags+=tags,tags.venders
"法二"
""set tags=.tags,tags;$HOME
"法三"
""set tags=tags;
""set autochdir


"******************************************************************************************"
"插件 easymotion,该插件是让你可以在vim 中 把光标快速移动 到你的可视区域
"映射 ss 为 快捷键, 当我按 ss 后, 再输入2个字符的前缀, 接着只需要按对应的 字母 就可以跳转到对应的地方
nmap ss <Plug>(easymotion-s2)


"******************************************************************************************"
"frazrepo/vim-rainbow配置，括号配对颜色区分

let g:rainbow_active = 1

let g:rainbow_conf = {
\   'guifgs': ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick'],
\   'ctermfgs': ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta'],
\   'operators': '_,\|+\|-_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'tex': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\       },
\       'css': 0,
\   }
\}

"******************************************************************************************"
"asyncrun.vim配置,asyncrun.vim运行异步Shell命令并输出到Quickfix窗口！
"自动打开Quickfix
let g:asyncrun_open = 12
"AsyncRun  AsyncReset AsyncStop


"******************************************************************************************"

""NerdCommenter注释工具配置
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' }}

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

""NerdCommenter注释工具的使用
"\cc 注释当前行和选中行
"\cn 没有发现和\cc有区别
"\c<空格> 如果被选区域有部分被注释，则对被选区域执行取消注释操作，其它情况执行反转注释操作
"\cm 对被选区域用一对注释符进行注释，前面的注释对每一行都会添加注释
"\ci 执行反转注释操作，选中区域注释部分取消注释，非注释部分添加注释
"\cs 添加性感的注释，代码开头介绍部分通常使用该注释
"\cy 添加注释，并复制被添加注释的部分
"\c$ 注释当前光标到改行结尾的内容
"\cA 跳转到该行结尾添加注释，并进入编辑模式
"\ca 转换注释的方式，比如：/**/和//
"\cl \cb 左对齐和左右对其，左右对其主要针对/**/
"\cu 取消注释

"******************************************************************************************"
"coc.nvim的配置,可以将要安装的插件写在下面，统一安装
" 补全提示的长度
set pumheight=10

let g:coc_global_extensions = [
		\ 'coc-marketplace',
		\ 'coc-markdownlint',
		\ 'coc-translator',
		\ 'coc-clangd',
		\ 'coc-snippets',
		\ 'coc-pyright',
		"\ 'coc-java',
		"\ 'coc-java-intellicode',
		\]

"******************************************************************************************"
"语法检查的插件ale
"始终开启标志列
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'

"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

"启用Quickfix，禁用loclist
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
"quickfix窗口显示警告或错误
"let g:ale_open_list = 1

"使用clang对c和c++进行语法检查，对python使用pylint进行语法检查
let g:ale_linters = {
\   'c': ['clang'],
\   "c++": ['clang'],
\   'python': ['pylint'],
\}

"文件内容发生变化时不进行检查
"let g:ale_lint_on_text_changed = 'never'
"打开文件时不进行检查
let g:ale_lint_on_enter = 0

"如果安装了airline，默认在airline中是显示ale内容的，可以手动关闭,即设置为0
"let g:airline#extensions#ale#enabled = 0


"******************************************************************************************"
