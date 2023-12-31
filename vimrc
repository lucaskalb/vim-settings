" -----------------------------------------------------------------------------
if has('termguicolors')
    set termguicolors
endif

let $RCPATH = '~/.vim/'
let $RC = $RCPATH.'vimrc'

let g:netrw_liststyle=3

" -----------------------------------------------------------------------------
filetype plugin indent on
syntax on
set title
set encoding=utf-8
set backspace=indent,eol,start
set noerrorbells
set confirm
set hidden
set splitbelow
set splitright
set fillchars=vert:│,fold:-,eob:~

" -----------------------------------------------------------------------------
set path=.,**
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
" -----------------------------------------------------------------------------
set nowrap
set linebreak
set nolist
set listchars=tab:›-,space:·,trail:◀,eol:↲
" -----------------------------------------------------------------------------
set number 
set relativenumber
set scrolloff=2
set cursorline
" -----------------------------------------------------------------------------
let &t_SI="\e[6 q"
let &t_EI="\e[2 q"
" -----------------------------------------------------------------------------
set autoindent
set smartindent
" -----------------------------------------------------------------------------
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
" -----------------------------------------------------------------------------
set ignorecase
set smartcase
set incsearch
set hls
let @/ = ""
" -----------------------------------------------------------------------------
set complete+=kspell
set completeopt=menuone,longest
set shortmess+=c

set spelllang=en
set nospell

" Netwr settings
let g:netrw_browse_split = 4
let g:netwr_altv = 1
set autochdir

" -----------------------------------------------------------------------------
set wildmenu
set wildmode=longest,full
set wildoptions=pum
set wildcharm=<c-z>
" -----------------------------------------------------------------------------
" https://github.com/sainnhe/edge.git 
set background=dark
colorscheme edge
"
" -----------------------------------------------------------------------------
" colorscheme habamax
" -----------------------------------------------------------------------------
set noshowmode
set laststatus=2

" -----------------------------------------------------------------------------
execute 'source '.$RCPATH.fnameescape('mappings.vim')
execute 'source '.$RCPATH.fnameescape('autocmds.vim')
execute 'source '.$RCPATH.fnameescape('statusbar.vim')
execute 'source '.$RCPATH.fnameescape('customcolors.vim')

