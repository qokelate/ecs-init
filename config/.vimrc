syntax enable

set nobackup
set writebackup " Enabled!
set noswapfile
set noundofile

set number
set background=dark
set shiftwidth=4
set ts=4
set expandtab
let g:solarized_termtrans=1

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

" These lines setup the environment to show graphics and colors correctly
set backspace=indent,eol,start
set nocompatible
set t_Co=256
let g:minBufExplForceSyntaxEnable = 1
if !has('gui_running')
set ttimeoutlen=10
augroup FastEscape
autocmd!
au InsertEnter * set timeoutlen =0
au InsertLeave * set timeoutlen =1000
augroup END
endif
set laststatus=2 " Always display the stataline in all window
set noshowmode "Hide the default mode text  

set laststatus=2
set statusline=%F%m%r%h%w%=\ [ft=%Y]\ %{\"[fenc=\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\"+\":\"\").\"]\"}\ [ff=%{&ff}]\ [asc=%03.3b]\ [hex=%02.2B]\ [pos=%04l,%04v][%p%%]\ [len=%L]

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set tabstop=4 shiftwidth=4 expandtab
