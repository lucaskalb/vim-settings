" -----------------------------------------------------------------------------
if has('termguicolors')
    set termguicolors
endif

let $RCPATH = '~/.vim/'
let $RC = $RCPATH.'vimrc'

let g:netrw_liststyle=3
" -----------------------------------------------------------------------------
" https://github.com/sainnhe/edge.git 
let g:edge_better_performance = 1
colorscheme edge

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
" set autochdir

" -----------------------------------------------------------------------------
set wildmenu
set wildmode=longest,full
set wildoptions=pum
set wildcharm=<c-z>

" -----------------------------------------------------------------------------
set noshowmode
set laststatus=2

" -----------------------------------------------------------------------------
"

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

Plug 'rhysd/vim-healthcheck'

Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

Plug 'Shougo/ddc.vim'
Plug 'shun/ddc-vim-lsp'

Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'kristijanhusak/vim-dadbod-completion'

call plug#end()


execute 'source '.$RCPATH.fnameescape('autocmds.vim')
execute 'source '.$RCPATH.fnameescape('statusbar.vim')
execute 'source '.$RCPATH.fnameescape('customcolors.vim')
execute 'source '.$RCPATH.fnameescape('mappings.vim')

" set foldmethod=expr
"   \ foldexpr=lsp#ui#vim#folding#foldexpr()
"   \ foldtext=lsp#ui#vim#folding#foldtext()

let g:nerdtree_tabs_open_on_console_startup = 1
"

let g:dbs = {
\  'ca_dev': 'postgresql://search_engine_core:YWNlODM0NTRlODVmYWY0M2VjOWQ0OGFi@contaazul-ca-pro-financeiro-2-rds.dev.contaazul.local:5432/contaazul'
\ }
