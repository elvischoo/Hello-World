set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

" 开启语法高亮  
syntax enable  

" 开启语法高亮
syntax on  

" 设置字体  
set guifont=Monaco\ 12

" 设置历史记录条数  
set history=2000  

" 检测文件类型  
filetype on  

" 针对不同的文件，采用不同的缩进方式  
filetype indent on  

" 允许插件  
filetype plugin on  

" 启动自动补全
filetype plugin indent on

" 文件修改之后自动读入
set autoread

" 启动后不显示提示
"set shortmess=atI

" 设置取消备份，禁止临时文件生成  
set nobackup  
set noswapfile  

" create undo file
set undolevels=1000 " how many undos
set undoreload=10000 " number of lines to save for undo
if v:version >= 730
    set undofile     " keep a persistent backup file
    set undodir=/tmp/vimundo/
endif

"set wildignore=*.swp,*.bak,*.pyc,*.class,.svn

" 显示当前横竖线  
"set cursorline  
"set cursorcolumn  

" 设置退出Vim之后内容显示在终端屏幕，可以用于查看和复制
" 好处:误删什么，如果以前屏幕打开可以用来找回
" set t_ti= t_te=

" 设置在Vim中可以使用鼠标，防止终端无法拷贝  
set mouse=a  

"==========================================
" Display Settings
"==========================================
"
" 显示当前行号和列号
set ruler

" 在状态栏显示正在输入的命令
set showcmd

" 左下角显示当前Vim模式
set showmode

" 光标移动至少保留的行数
"set scrolloff=7

" 命令行（在状态行下）的高度，默认为1，这里是2
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P

" 总是显示状态栏(Powerline需要2行)  
set laststatus=2  

" 显示行号  
set number  

" 指定不折行
set nowrap  

" 设置代码匹配,包括括号匹配情况  
set showmatch  

" how many tenths of a second to blink when matching brackets
" setmatchtime=2

" 开启及时搜索(is)  
set incsearch  

" 设置搜索高亮(hlsearch)  
set hls  

" 设置搜索时忽略大小写  
set ignorecase  

" 当搜索的时候尝试smart  
set smartcase  

" 设置代码折叠
"set foldenable
" 折叠方法
" manual 手工折叠
" indent 缩进折叠
" expr 表达式折叠
" syntax 语法折叠
" diff 对没有更改的文件折叠
" marker 标记折叠
"set foldmethod=indent
"set foldlevel=99

" 设置C/C++方式自动对齐  
set autoindent  
set cindent  
set smartindent  

" 设置tab宽度  
set tabstop=4  

" 设置自动对齐空格数  
set shiftwidth=4  

" 按退格键时可以一次删除4个空格
"set softtabstop=4

 " 编辑的时候将所有的tab设置为空格(expandtab)  
 set et  

 " 使用Backspace直接删除tab  
 set smarttab  

" 不在单词中间折行  
set lbr  

" 设置字体
set gfn=Consolas:h12

set guioptions -=m
set guioptions -=T

colorscheme torte

let Tlist_Ctags_Cmd = 'C:\Program Files (x86)\Vim\vim73e\ctags'
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window = 1
let Tlist_Compact_Format = 0
let Tlist_Auto_Open = 1
let Tlist_Use_SingleClick = 1
let Tlist_WinWidth = 20
nnoremap <silent> <A-4> :TlistToggle<CR>
set tags=./tags
set tags+=D:\Workarea\Project\sd6186\code\lib_external\HacLink\tags

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
