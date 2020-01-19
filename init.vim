" nvim的必要配置
let g:python3_host_prog='C:\Users\dj\AppData\Local\Programs\Python\Python38\python.exe'
let g:python_host_prog='C:\Python27\python2.7.exe'
" ===000vim初始化配置===
" ======================
" ---001必要配置---
" <++> 
set nocompatible
" 开启感知文件类型
filetype on
" <++> 
filetype indent on
" <++> 
filetype plugin on
" <++> 
filetype plugin indent on
" 设置编码格式
set encoding=utf-8
set fileencoding=utf-8
" 可以使用鼠标
set mouse=a
" ===
" === Status/command bar
" ===
" <++> 
set laststatus=2
" 自动切换工作目录 
set autochdir
" 历史命令查看q: 
set showcmd
" <++> 
set formatoptions-=tc
" ====================
" ---002显示设置---
" 设置文件位置
set ruler
" 设置留底五行
set scrolloff=5
" 开启语法高亮
syntax on
" <++> 
syntax enable
" 行号显示
set number
" 关闭相对行号
" set norelativenumber
" 开启相对行号
set relativenumber
" Show command autocomplete
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
" 补全指令
set wildmenu      " show a navigable menu for tab completion
" <++> 
"set wildmode=longest,list,full
" 行线条
set cursorline
" 设置空格符号
" set list
set listchars=tab:\|\ ,trail:▫ 
set listchars=trail:▫
" 字体不会超出当前屏幕
set wrap
" 光标
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" ===
" === Restore Cursor Position
" ===
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" ====================
" ---003兼容性配置---
" Better backspace设置可以删除至下一行
" set backspace=indent,eol,start
" " 解决插入模式下delete/backspce键失效问题
" set backspace=2
let &t_ut=''

" =================
" ===100基础操作===
" =================
" 禁用快捷键s
noremap s <nop>
noremap <C-z> <nop>
" =========================
" ---101打开关闭保存退出---
" =========================
" <++> 
noremap Q :q<CR>
" <++> 
noremap S :w<CR>
" <++> 
inoremap jk <Esc>
" 保存配置或自动生效配置
nnoremap R :w<CR>:source $MYVIMRC<CR>
" nnoremap R :w<CR>:source \Users\dj\_ideavimrc<CR>
" nnoremap R :w<CR>:source $VIM/.vim/.vimrc
" autocmd BufwritePost $MYVIMRC source $ MYVIMRC
" nnoremap R :source \Users\dj\_ideavimrc<CR>
"
" Linux_Open the vimrc file anytime
noremap <LEADER>rc :e ~\AppData\Local\nvim\init.vim <CR>
" Open Startify
noremap <LEADER>st :Startify<CR>
" =============
" ---102移动---
" =============
" normal模式下移动
noremap H ^
noremap L $
" nnoremap H ^
" nnoremap L $
" Insert模式下移动
inoremap <C-l> <right>
inoremap hH <left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
" 写入模式下快速去到末尾 
inoremap <C-a> <ESC>A
" 写入模式下快速去到行首出现tab异常
" inoremap <C-i> <ESC>I
"
"
" 向下换行
noremap <space><CR> o<Esc>
inoremap <leader><CR> <Esc>o
" 向上换行
noremap <space><space><CR> O<Esc>
inoremap <leader><leader><CR> <Esc>O
" 快速翻页 
nnoremap J <C-d>
nnoremap K <C-u>
" nnoremap J 6j
" nnoremap K 6k
"

" =====================
" ---103复制粘贴撤销---
" =====================
" :echo has('clipboard')输出为1为支持可以复制的系统剪切板
" 共享系统剪切板
set clipboard=unnamed
" make Y to copy till the end of the line
nnoremap Y y$
" Copy to system clipboard
vnoremap Y "+y
" 自动缩进
set autoindent
" 设置粘贴混乱
noremap <leader>sp :set paste<CR>
" 关闭粘贴缩进混乱
noremap <leader>nsp :set nopaste<CR>
" Redo
nnoremap U <C-r>
" inoremap <C-z> <Esc>ua

" <++> 
" map <LEADER>sr :%s/ 
" 块命令修改
" nnoremap <Space>v <C-v>
nnoremap <LEADER>v <C-v>
" 自动增修改 
" nnoremap <Space>a <C-a>
nnoremap <LEADER>a <C-a>
" nnoremap <Space>x <C-x>
" 自减修改 
nnoremap <LEADER>x <C-x>

" =================
" ---104搜索设置---
" =================

" 搜索相关命令
set hlsearch " 高亮搜索内容
" 关闭每次打开保留搜索内容高亮
exec "nohlsearch"
"边搜索边高亮
set incsearch
set ignorecase
set smartcase
noremap <LEADER><CR> :nohlsearch<CR> "
noremap = nzz
noremap - Nzz
" Duplicate words
map <LEADER>fd /\(\<\w\+\>\)\_s*\1

" =========================
" ---105分屏 &  窗口移动---
" =========================

" <++> 
map sl :set splitright<CR>:vsplit<CR>
" nnoremap sl :set splitright<CR>:vsplit<CR>
" <++> 
map sj :set splitbelow<CR>:split<CR>
" nnoremap sj :set nosplitbelow<CR>:split<CR>
" <++> 
map sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
" <++> 
map sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
" ===窗口===
" Window operation
nnoremap <Space>w <C-W>w
nnoremap <Space>j <C-W>j
nnoremap <Space>k <C-W>k
nnoremap <Space>h <C-W>h
nnoremap <Space>l <C-W>l
nnoremap <Space>p <C-W>p
" ===屏幕大小设置===
" Resize splits with arrow keys
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>
" ===屏幕调换===
" Place the two screens up and down
noremap sd <C-w>t<C-w>K
" Place the two screens side by side
noremap sv <C-w>t<C-w>H
" ===屏幕反向调换===
" Rotate screens
noremap srd <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H
" === Tab management
" Folding
" <++> 
noremap <silent> <LEADER>o za
" Create a new tab with tu
" <++> 
map tk :tabe<CR>
" Move around tabs with tn and ti
" <++> 
map th :-tabnext<CR>
map tl :+tabnext<CR>
" Move the tabs with tmn and tmi
" <++> 
map tmh :-tabmove<CR>
map tml :+tabmove<CR>

" =================
" ---106指令输入---
" =================

map <LEADER>/ :!
map <LEADER>r :r !

" Spilling Cheek with \sc开启 ctrlx建议或z=
map <LEADER>sc :set spell!<CR>
noremap <C-x> ea<C-x>s
inoremap <C-x> <Esc>ea<C-x>s
" ===========================
" ---107 markdown 快捷写入---
" ===========================

inoremap ,,f <Esc>/<++><CR>:nohlsearch<CR>c4l
inoremap ,tg <++> 
inoremap ,,n ---<Enter><Enter>
inoremap ,,s~~~~ <++><Esc>F~hi
inoremap ,,i ** <++><Esc>F*i
inoremap ,,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
inoremap ,,h ====<Space><++><Esc>F=hi
inoremap ,,p ![](<++>) <++><Esc>F[a
inoremap ,,a [](<++>) <++><Esc>F[a
inoremap <LEADER>1 #<Space><Enter><++><Esc>kA
noremap <LEADER>1 o#<Space><Enter><++><Esc>kA
inoremap <LEADER>2 ##<Space><Enter><++><Esc>kA
noremap <LEADER>2 o##<Space><Enter><++><Esc>kA
inoremap <LEADER>3 ###<Space><Enter><++><Esc>kA
noremap <LEADER>3 o###<Space><Enter><++><Esc>kA
inoremap <LEADER>4 ####<Space><Enter><++><Esc>kA
noremap <LEADER>4 o####<Space><Enter><++><Esc>kA
inoremap ,,l --------<Enter>
" Press leader twice to jump to the next '<++>' and edit it
noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l
" 用了搜狗的成对出现
" inoremap ,w `<Esc>A <++><Esc>F`i
" inoremap ," "<Esc>A <++><Esc>F"i
" inoremap ,' '<Esc>A <++><Esc>F'i
" 没用了搜狗的成对出现
inoremap ,,w `` <++><Esc>F`i
inoremap ,," "" <++><Esc>F"i
inoremap ,,' "" <++><Esc>F'i
" ===快捷编辑===
inoremap ,b **** <++><Esc>F*hi
inoremap <leader>b <Esc>I**<Esc>A**
" 插入无序列表
noremap ,- <Esc>I- <Esc>
" inoremap ,- <Esc>I- <Esc> 无用
"  插入num
inoremap ,mm <Esc>I1. <Esc>j
" 快速插入后缀.md
noremap  ,,e f)i.md<Esc>
" ===快捷删除===
inoremap <leader>b <Esc>^xx<Esc>$xxA
" del
noremap  ,d ^d2wj
noremap ,dm k^yf jP^<C-a>j
" ====================
" ---108 有趣的操作---
" ====================
" :%TOhtml-->将当前文件转为HTML(这是一条笔记)
" Call figlet linux 下安装figlet
" map tx :r !figlet
" =====================
" ---109 不清楚的指令---
" =====================
" Space to Tab
" nnoremap <LEADER>tt :%s/    /\t/g
" vnoremap <LEADER>tt :s/    /\t/g
" Open up lazygit
noremap \g :term lazygit<CR>
noremap <c-g> :term lazygit<CR>
" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h
" ===============
"  ---插件安装---
" ===============
" Compile function
" noremap <leader>r :call CompileRunGcc()<CR>
" func! CompileRunGcc()
" 	exec "w"
" 	if &filetype == 'c'
" 		exec "!g++ % -o %<"
" 		exec "!time ./%<"
" 	elseif &filetype == 'cpp'
" 		set splitbelow
" 		exec "!g++ -std=c++11 % -Wall -o %<"
" 		:sp
" 		:res -15
" 		:term ./%<
" 	elseif &filetype == 'java'
" 		exec "!javac %"
" 		exec "!time java %<"
" 	elseif &filetype == 'sh'
" 		:!time bash %
" 	elseif &filetype == 'python'
" 		set splitbelow
" 		:sp
" 		:term python3 %
" 	elseif &filetype == 'html'
" 		silent! exec "!chromium % &"
" 	elseif &filetype == 'markdown'
" 		exec "MarkdownPreview"
" 	elseif &filetype == 'tex'
" 		silent! exec "VimtexStop"
" 		silent! exec "VimtexCompile"
" 	elseif &filetype == 'go'
" 		set splitbelow
" 		:sp
" 		:term go run %
" 	endif
" endfunc
" ===================
" ===200 安装开始===
" ===powershell的nvim的路径===
call plug#begin('~\AppData\Local\nvim\autoload')
" ===============
" 201 状态栏修饰 aieline
Plug 'vim-airline/vim-airline'
" ===============
" 211 vim主题样式部分 snazzy
Plug 'connorholyday/vim-snazzy'
" ===============
" 221引导界面 startify
Plug 'mhinz/vim-startify'
" ===============
" <++> git序号栏显示修改信息
Plug 'mhinz/vim-signify'
" ===============
" <++> 使用 `,m`在序号栏打标记,]+`&`[ 跳转 signature m+<sapce>delall
Plug 'kshenoy/vim-signature'
" ===============
" <++> 错误检查
 Plug 'dense-analysis/ale'
" ===============
" <++> 自动补全插件Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" ===============
" <++> ctrtp搜索打开文件 ctrlp.vim
Plug 'kien/ctrlp.vim'
" ===============
" <++> FZF文件快速搜索
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" ===============
" <++> 安心阅读 junegunn/goyo.vim
Plug 'junegunn/goyo.vim'
" ===============
" <++> 缩进标尺indentLine
Plug 'Yggdroot/indentLine'
" ===============
" <++> 代码补全插件coc
Plug 'neoclide/coc.nvim'
" ===============
" <++>  File navigation 文件目录树
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" ===============
" <++> git 目录树修改图标显示
Plug 'Xuyuanp/nerdtree-git-plugin'
" ===============
" <++> 修改版本库 undotree
Plug 'mbbill/undotree'
" ===============
" <++> 备注代码 gc gcc gcap
Plug 'tpope/vim-commentary'
" ===============
" <++> 快速跳转快捷键SS自己设置
Plug 'easymotion/vim-easymotion'
" ===============
" <++> 包裹和替换成对符号
Plug 'tpope/vim-surround'
" ===============
" markdwon浏览器预览
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
" ===============
" vim-wiki笔记本体系
Plug 'vimwiki/vimwiki'
" ===============
" <++> markdown图片粘贴
Plug 'ferrine/md-img-paste.vim'
" ===============
" markdwon浏览器预览2(和浏览器预览冲突)
" Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
" <++> 自动对齐 markdown
Plug 'godlygeek/tabular'
" <++> markdown语法高亮显示
" Plug 'plasticboy/vim-markdown'
" <++> 自动生成目录
" Plug 'mzlogin/vim-markdown-toc'
" <++> markdown目录管理插件

call plug#end()
"  *******插件安装结束***********

" experimental
" set lazyredraw
" set regexpengine=1
colorscheme snazzy
" <++> 快速跳转快捷键SS自己设置
nmap ss <Plug>(easymotion-s2)
" ===
" === NERDTree
" ===
nnoremap tt :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = "N"
let NERDTreeMapUpdirKeepOpen = "n"
let NERDTreeMapOpenSplit = ""
let NERDTreeMapOpenVSplit = "I"
let NERDTreeMapActivateNode = "i"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapOpenInTabSilent = "O"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = ""
let NERDTreeMapChangeRoot = "l"
let NERDTreeMapMenu = ","
let NERDTreeMapToggleHidden = "zh"


" ===
" === NERDTree-git
" ===
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
" ===
" === FZF
" ===
noremap <leader>p :FZF<CR>
noremap <C-w> :Buffers<CR>
noremap <c-q> :History:<CR>
" noremap <C-f> :Ag<CR>
" noremap <C-h> :MRU<CR>
" noremap <C-t> :BTags<CR>
" noremap <C-l> :LinesWithPreview<CR>
" ===
" === Goyo
" ===
map <LEADER>gy :Goyo<CR>
" ===
" === MarkdownPreview
" ===
nnoremap <space>r :MarkdownPreview<CR>
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = 'chrome'
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'
" ===
" === Undotree
" ===
map LL :UndotreeToggle<CR>

" ===
" === 缩进标尺indentLine
" ===
noremap <leader>ty :IndentLinesToggle<CR>

" ===
" ===vim-wiki笔记本体系
" ===
let wiki_1 = {}
let wiki_1.path = '~/Github/notebooks/'
let wiki_1.syntax = 'markdown'
let wiki_1.ext = '.md'
let g:vimwiki_ext1syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let wiki_2 = {}
let wiki_2.path = '~/Github/notebooks/Java/'
let wiki_2.syntax = 'markdown'
let wiki_2.ext = '.md'
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let wiki_3 = {}
let wiki_3.path = '~/Github/notebooks/Linux'
let wiki_3.syntax = 'markdown'
let wiki_3.ext = '.md'
let g:vimwiki_list = [wiki_1,wiki_2,wiki_3]
let g:vimwiki_ext3syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
nnoremap <Space>bb :VimwikiGoBackLink<CR>

" ===
" === markdown图片粘贴
" ===
noremap  <space>pp :call mdip#MarkdownClipboardImage()<CR>
