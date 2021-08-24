"
" KEY BINDINGS

" INSERT MODE MAPPINGS
inoremap <nowait> jj <esc>
" inoremap kj <esc>
" inoremap jk <esc>

if exists('g:started_by_firenvim')
  inoremap <leader>z <c-o>:w <bar> call firenvim#focus_page() <bar> q <cr>
  inoremap <leader><cr> <c-o>:w <bar> call firenvim#press_keys("<LT>CR>") <bar> q <cr>
  inoremap <leader>q <c-o>:call firenvim#focus_page() <bar> q! <cr>
else
  inoremap <leader>z <ESC>:update <bar> BufferDeleteOrQuit<cr>
  inoremap <leader>Q <c-o>:q!<cr>
  inoremap <leader>q <ESC>:BufferDeleteOrQuit<cr>
endif

inoremap <leader>w <c-o>:update<cr>
" Escape wrapper characters
imap <c-e> <Plug>delimitMateS-Tab
imap <leader>e <Plug>delimitMateS-Tab
" Insert character at end of line
imap <leader><leader><leader> <c-o>A,
imap <leader><leader>; <c-o>A;
imap <leader><leader>a <c-o>A
imap <leader><leader>i <c-o>I
" Move to next/previous line
inoremap <leader>j <c-o>j
inoremap <leader>k <c-o>k
" Insert line befoe/after
inoremap <leader>o <c-o>o
inoremap <leader>O <c-o>O

" Change line indent
imap <leader>< <c-o><<
imap <leader>> <c-o>>>
" Next tab stop
imap <leader>f <c-f>
inoremap <leader><leader>s $

" NORMAL MODE MAPPINGS
if !exists('g:vscode')
  nnoremap <leader>w :update<cr>

  if exists('g:started_by_firenvim')
    nnoremap <leader>z :w <bar> call firenvim#focus_page() <bar> q <cr>
    nnoremap <leader><cr> :w <bar> call firenvim#press_keys("<LT>CR>") <bar> q <cr>
    nnoremap <leader>q :call firenvim#focus_page() <bar> q! <cr>
  else
    nnoremap <leader>z :w <bar> BufferDeleteOrQuit<cr>
    nnoremap <leader>Q :q!<cr>
    nnoremap <leader>q :BufferDeleteOrQuit<cr>
  endif

  " Buffer delete
  nnoremap <leader>bd :bd<cr>
  nnoremap gx :bd<cr>
  " Buffer next
  nnoremap gt :bnext<cr>
  " Buffer previous
  nnoremap gT :bprevious<cr>
endif

nnoremap <leader>ya :%y<cr>
nnoremap <leader>tc :TC<cr>
nmap <leader>vr :so $MYVIMRC<cr>
" Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
nnoremap <silent><leader>dj m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><leader>dk m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><leader>j :put _<CR>
nnoremap <silent><leader>k :put! _<CR>
" Remove all empty lines
nnoremap <leader>cel :Cel<cr>
" Remove all lines
nnoremap <leader>cl :Cl<cr>
" Dismiss error window
nnoremap <leader>lcl :lcl<cr>
" Jump to end of line
nnoremap <leader><leader>a A
" Jump to beginning of line
nnoremap <leader><leader>i I
" Jump to end of line and insert ,
nnoremap <leader><leader>, A,<esc>
" Jump to end of line and insert ;
nnoremap <leader><leader>; A;<esc>
" Clear search highlight
nnoremap <c-n> :noh<cr>

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" nnoremap <c-n> :call OpenTerminal()<CR>
nnoremap <c-j> :sp term://zsh <CR>
" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
