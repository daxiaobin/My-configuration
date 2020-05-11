"----------------------------"
"----------Vundle------------"
"----------------------------"
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" Let Vundle manage itself
Plugin 'VundleVim/Vundle.vim'

Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()
filetype plugin indent on


let g:auto_save = 1

"----------------------------"
"--------   NERDTree  -------"
"----------------------------"
"set shortcut key
"map <F4> :NERDTreeMirror<CR>
"map <F4> :NERDTreeToggle<CR>

"----------------------------"
"--------    CtrlP    -------"
"----------------------------"
let g:ctrlp_map = ',,'
let g:ctrlp_open_multiple_files = 'v'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git)$',
  \ 'file': '\v\.(log|jpg|png|jpeg)$',
  \ }


"----------------------------"
"--------  Syntastic  -------"
"----------------------------"
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let b:syntastic_cpp_cflags = '-std=c++11 -w'

"----------------------------"
"------ YouCompleteMe -------"
"----------------------------"
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'

"----------------------------"
"--------Global Config-------"
"----------------------------"
syntax on
set nu
"设置主题颜色
set background=dark
"colorscheme solarized
colorscheme molokai
"colorscheme darkblue
"colorscheme default
let g:molokai_original = 1
let g:rehash256 = 1


set noswapfile
set nobackup
if has('mouse')
	set mouse-=a
endif

filetype on

set history=1000
set cursorline
"set cursorcolumn

set autoindent
set cindent
set smartindent

"set expandtab " space grid replace tab
set backspace=2
set tabstop=4
set shiftwidth=4
set softtabstop=4

set linebreak
set showmatch

set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8
"set fileformats=unix
"set encoding=prc
set encoding=utf-8

set hlsearch
set incsearch

set laststatus=2
set ruler

"no \n
set nowrap
set guifont=Courier\ new:h20

autocmd BufNewFile *.[ch],*.hpp,*.cpp,*.cc exec ":call Addreadme()"

function Addreadme()
"    call setline(1, " ///")
	call setline(1, " /// @file    " .expand("%:t"))
	call append(1, " /// @author  daxiaobing(248918860@qq.com)")
	call append(2, " /// @date    ".strftime("%Y-%m-%d %H:%M:%S"))
	call append(4, " ///")
	call append(3, " ")
	call append(4, "#include <iostream>")
	call append(5, "using std::cout;")
	call append(6, "using std::endl;")
endf


"set maplearder
"let  mapleader = ";"
nmap <Leader>M %
map <silent> <leader>ee :!vim ~/.vimrc<cr>


"让配置变更立即生效
autocmd BufwritePost $MYVIMRC source $MYVIMRC


"定义快捷键到行首和行尾
nmap LE $
nmap LB ^

"开启实时搜索功能
"set incsearch
"搜索时大小写不敏感
"set ignorecase
"关闭兼容模式
"set nocompatible
"vim自身命令行智能补全
"set wildmenu

Plugin 'vim-airline'           "状态栏插件"
set laststatus=2                      "永远显示状态栏"
set t_Co=256                                   "在windows中用xshell连接打开vim可以显示色彩"
let g:airline#extensions#tabline#enabled = 1            "显示tab/buf窗口"
Plugin 'vim-airline-themes'                                       "状态栏主题插件"
let g:airline_theme='simple'

Plugin 'axiaoxin/favorite-vim-colorscheme'                "颜色主题插件"

Plugin 'auto-pairs'                         "符号自动配对插件"

"基于缩进或语法进行代码折叠
set foldmethod=indent
"set foldmethod=syntax
set nofoldenable       "启动vim时关闭折叠"

let g:syntastic_cpp_compiler = 'g++'  "change the compiler to g++ to support c++11."
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libc++' "set the options of g++ to suport c++11."

"当光标一段时间保持不动了，就禁用高亮
"autocmd cursorhold * set nohlsearch
"当输入查找命令时，再启用高亮
"noremap n :set hlsearch<cr>n
"noremap N :set hlsearch<cr>N
"noremap / :set hlsearch<cr>/
"noremap ? :set hlsearch<cr>?
"noremap * *:set hlsearch<cr>"

noremap n :set hlsearch<cr>n
noremap N :set hlsearch<cr>N
noremap / :set hlsearch<cr>/
noremap ? :set hlsearch<cr>?
noremap * *:set hlsearch<cr>

nnoremap <c-h> :call DisableHighlight()<cr>
function! DisableHighlight()
	set nohlsearch
endfunc
"上述部分是设置按ctrl+H取消高亮搜索显示。

" For Haskell
:let hs_highlight_delimiters=1            " 高亮定界符
:let hs_highlight_boolean=1               " 把True和False识别为关键字
:let hs_highlight_types=1                 " 把基本类型的名字识别为关键字
:let hs_highlight_more_types=1            " 把更多常用类型识别为关键字
:let hs_highlight_debug=1                 " 高亮调试函数的名字
:let hs_allow_hash_operator=1             " 阻止把#高亮为错误
