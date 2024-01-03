" -----------------------------------------------------------------------------
" Autocomandos
" -----------------------------------------------------------------------------

" Salva e carrega visualizações
" autocmd BufWinLeave ?* mkview
" autocmd BufWinEnter ?* silent loadview


" Tabulações para arquivos .asm...
autocmd filetype asm setlocal noexpandtab ts=8 sw=8 sts=8
autocmd filetype yaml setlocal noexpandtab ts=2 sw=2 sts=2
autocmd filetype yml setlocal noexpandtab ts=2 sw=2 sts=2
autocmd filetype md setlocal noexpandtab ts=2 sw=2 sts=2
autocmd FileType sql setlocal omnifunc=vim_dadbod_completion#omni

" Não expande tabulações em arquivos make...
autocmd filetype make setlocal noexpandtab 

" Redimensionar janelas quando terminal mudar de tamanho...
autocmd vimresized * wincmd =

autocmd filetype netwr setlocal foldenable

autocmd! FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction
autocmd! User FzfStatusLine call <SID>fzf_statusline()

if executable('pylsp')
    " pip install python-lsp-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pylsp',
        \ 'cmd': {server_info->['pylsp']},
        \ 'allowlist': ['python'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

call ddc#custom#patch_filetype(['sql', 'mysql', 'plsql'], 'sources', 'dadbod-completion')
call ddc#custom#patch_filetype(['sql', 'mysql', 'plsql'], 'sourceOptions', {
\ 'dadbod-completion': {
\   'mark': 'DB',
\   'isVolatile': v:true,
\ },
\ })

" Source is automatically added, you just need to include it in the chain complete list
let g:completion_chain_complete_list = {
    \   'sql': [
    \    {'complete_items': ['vim-dadbod-completion']},
    \   ],
    \ }
" Make sure `substring` is part of this list. Other items are optional for this completion source
let g:completion_matching_strategy_list = ['exact', 'substring']
" Useful if there's a lot of camel case items
let g:completion_matching_ignore_case = 1
