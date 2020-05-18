" 设置leader键，leader键就是一个自定义的前缀键，可以用来个性化定义一些命令
let mapleader=" " 
syntax on "语法高亮
let &t_ut=''
filetype on
filetype plugin indent on
set backspace=2 "解决插入模式下delete/backspce键失效问题
set background=dark
set nocompatible "去除和vi的不一致性
set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8
set encoding=utf-8
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set number
set laststatus=2
if has('mouse')
    set mouse-=a
endif
"使得下次打开同一文件时光标处于上次关闭文件时的位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal!g'\"" | endif
set cursorline
set showcmd
set wildmenu "在vim中按 :xx 后再按tab键会显示可选的菜单
set ignorecase "搜索时忽略大小写
set smartcase "搜索时智能大小写
set hlsearch "搜索时高亮显示
set incsearch "搜索时一边输入字符一边高亮显示
"这个命令的意思是在命令模式下按 : 然后输入nohlsearch就可以取消高亮
exec "nohlsearch" 
"设置空格+enter取消高亮
noremap <LEADER><CR> :nohlsearch<CR>  "noremap a b  将a键替换为b键，nore是不用递归的意思

map S :w<CR>
map Q :q<CR>
"以下四行是分屏操作，分屏后切换光标按ctrl+w+[上下左右]
map sr :set splitright<CR>:vsplit<CR>
map sl :set nosplitright<CR>:vsplit<CR>
map st :set nosplitbelow<CR>:split<CR>
map sb :set splitbelow<CR>:split<CR>
map <LEADER>j <C-w>j
map <LEADER>k <C-w>k
map <LEADER>h <C-w>h
map <LEADER>l <C-w>l 
map c<UP> :res +5<CR>
map c<DOWN> :res -5<CR>
map c<LEFT> :vertical resize-5<CR>
map c<RIGHT> :vertical resize+5<CR>
map R :source $MYVIMRC<CR>

"-----------------插件相关----------------------------------------------
set rtp+=~/.vim/bundle/Vundle.vim "设置包括vundle和初始化相关的runtime path
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'connorholyday/vim-snazzy'
Plugin 'preservim/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'auto-pairs'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'w0rp/ale'
Plugin 'vim-cpp-enhanced-highlight'
Plugin 'skywind3000/asyncrun.vim'
"Plugin 'dense-analysis/ale'
call vundle#end()

"----------------------------YouCompleteMe-----------------------------
"----------------------------------------------------------------------
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion=0
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_add_preview_to_completeopt = 0
"let g:ycm_show_diagnostics_ui = 0 "关闭代码诊断
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-z>'
set completeopt=menu,menuone

noremap <c-z> <NOP>

let g:ycm_semantic_triggers =  {
           \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
           \ 'cs,lua,javascript': ['re!\w{2}'],
           \ }
"----------------------------------------------------------------------
"----------------------------------------------------------------------

"------------------------------------ctrlp-----------------------------
"----------------------------------------------------------------------
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_map = ',,'  "模糊搜索当前目录极其子目录下的所有文件
map ,f :CtrlPMRU<CR>    
"ctrl + j/k  # 进行上下选择
"ctrl + x    # 在当前窗口水平分屏打开文件
"ctrl + v    # 同上, 垂直分屏
"ctrl + t    # 在tab中打开
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1
"-----------------------------------------------------------------------
"-----------------------------------------------------------------------

"--------------------------------NERDTree -----------------------------
"----------------------------------------------------------------------
map <LEADER>n :NERDTreeToggle<CR> "打开NEARTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree())|q|endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 设置宽度
let NERDTreeWinSize=31
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 显示书签列表
let NERDTreeShowBookmarks=1

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
"----------------------------------------------------------------------
"----------------------------------------------------------------------

"-------------------------------ale------------------------------------
"----------------------------------------------------------------------
let g:ale_linters_explicit = 1
let g:ale_linters = {
  \   'csh': ['shell'],
  \   'zsh': ['shell'],
  \   'go': ['gofmt', 'golint'],
  \   'python': ['flake8', 'mypy', 'pylint'],
  \   'c': ['gcc', 'cppcheck'],
  \   'cpp': ['gcc', 'cppcheck'],
  \   'text': [],
  \}
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++11'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''
let g:ale_list_window_size = 5
"----------------------------------------------------------------------
"----------------------------------------------------------------------

"-----------------------vim-cpp-enhanced-highlight---------------------
"----------------------------------------------------------------------
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_no_function_highlight = 1
"----------------------------------------------------------------------
"----------------------------------------------------------------------

"-------------------------echodoc--------------------------------------
"----------------------------------------------------------------------
let g:echodoc#type = "echo" " Default value
set noshowmode
let g:echodoc_enable_at_startup = 1
"----------------------------------------------------------------------
"----------------------------------------------------------------------

"------------------------asynsrun--------------------------------------
"----------------------------------------------------------------------
" 自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 6
" 任务结束时候响铃提醒
let g:asyncrun_bell = 1
" 设置 F10 打开/关闭 Quickfix 窗口
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>
"----------------------------------------------------------------------
"----------------------------------------------------------------------

"-------------------------主题设置-------------------------------------
set t_Co=256            "在windows中用xshell等连接打开vim可以显示色彩
let g:airline#extensions#tabline#enabled = 1         "显示tab/buf窗口
let g:airline_theme='simple'
"let g:airline_theme='molokai'
let g:airline#extensions#tabline#enabled = 1
"----------------------------------------------------------------------

"---------------------------For Haskell--------------------------------
:let hs_highlight_delimiters=1            " 高亮定界符
:let hs_highlight_boolean=1               " 把True和False识别为关键字
:let hs_highlight_types=1                 " 把基本类型的名字识别为关键字
:let hs_highlight_more_types=1            " 把更多常用类型识别为关键字
:let hs_highlight_debug=1                 " 高亮调试函数的名字
:let hs_allow_hash_operator=1             " 阻止把#高亮为错误
"------------------------------------------------------------------------
"let g:syntastic_cpp_compiler = 'g++'  "change the compiler to g++ to support c++11.
"let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libc++' "set the options of g++ to suport c++11.

