" -----------------------------------------------------------------------------
" Autocomandos
" -----------------------------------------------------------------------------

" Salva e carrega visualizações
autocmd BufWinLeave ?* mkview
autocmd BufWinEnter ?* silent loadview

" Tabulações para arquivos .asm...
autocmd filetype asm setlocal noexpandtab ts=8 sw=8 sts=8
autocmd filetype yaml setlocal noexpandtab ts=2 sw=2 sts=2
autocmd filetype yml setlocal noexpandtab ts=2 sw=2 sts=2
autocmd filetype md setlocal noexpandtab ts=2 sw=2 sts=2

" Não expande tabulações em arquivos make...
autocmd filetype make setlocal noexpandtab 

" Redimensionar janelas quando terminal mudar de tamanho...
autocmd vimresized * wincmd =

autocmd filetype netwr setlocal foldenable

