let mapleader = ' '

" Command
noremap ; :
vnoremap ; :

" Insert completion...

" -- Select with arrows up and down --
"inoremap <expr> <up> pumvisible() ? '<c-p>' : '<up>'
"inoremap <expr> <down> pumvisible() ? '<c-n>' : '<down>'

" -- Accept with right arrow or enter --
"inoremap <expr> <right> pumvisible() ? '<c-y>' : '<right>'
"inoremap <expr> <cr> pumvisible() ? '<c-y>' : '<cr>'

" -- Cancel completion with left arrow --
"inoremap <expr> <left> pumvisible() ? '<c-e>' : '<left>'

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" Helpers
map <f2> :set spell!<cr>
map <f3> :set wrap!<cr>
map <f4> :term<cr>

" Idention
vmap < <gv
vmap > >gv

" Scrolling
nmap <c-down> <c-d>
imap <c-down> <c-d>
nmap <c-up> <c-u>
nmap <c-up> <c-u>

nmap <c-d> <c-d>zz
imap <c-d> <c-d>zz
nmap <c-u> <c-u>zz
imap <c-u> <c-u>zz

" Close chars
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>

" Highlight
map <silent> <leader>hh :set hls!<cr>
map <silent> <leader>hc :let @/ = ""<cr>

" Paste and Copy
vmap <silent> <leader>yy "+y
vmap <silent> <leader>dd "+c

map <leader>p "0p
map <leader>P "0P

" Buffers
map <leader>bn :enew<cr>
map <leader>, :bp<cr>
map <leader>. :bn<cr>

" Save Buffer
map <leader>w :update<cr>

" Column Limit
map <silent> <leader>cc :execute "set cc=" . (&colorcolumn == "" ? "80" : "")<cr>

" Folding
map <leader>ff za
map <leader>fg zi
map <leader>fe zf}

" Find Files
map <leader>sf :FZF<cr>

" Nerd Tree
nnoremap <leader>ee :NERDTreeTabsToggle<cr>
nnoremap <leader>es :NERDTreeFind<cr>

" Tabulação
map <leader>ta :tab ball<cr>
map <leader>to :tabonly<cr>

" Explorer
nnoremap <leader>t :tabe %<cr>

" Replace
nnoremap <leader>sr :%s/<C-R><C-W>/

" LSP
map <F6> <plug>(lsp-code-action-float)



