" FIRENVIM CONFIG
if exists('g:started_by_firenvim')
  set laststatus=0
  set guifont=Hack:h16
  au BufEnter q4launch.atlassian.net_*.txt set filetype=markdown

  " KEYBINDINGS
  tmap <D-v> <C-w>"+
  nnoremap <D-v> "+p
  vnoremap <D-v> "+p
  inoremap <D-v> <C-R><C-O>+
  cnoremap <D-v> <C-R><C-O>+
else
  set laststatus=2
endif

let g:firenvim_config = {
    \ 'globalSettings': {
        \ 'alt': 'all',
    \  },
    \ 'localSettings': {
        \ '.*': {
            \ 'cmdline': 'neovim',
            \ 'priority': 0,
            \ 'selector': 'textarea:not([readonly])',
            \ 'takeover': 'never',
        \ },
    \ }
\ }

let fc = g:firenvim_config['localSettings']
let fc['https://messages.google.com'] = {'takeover': 'never', 'priority': 1}
let fc['https://docs.google.com/.*'] = {'takeover': 'never'}
let fc['https://keepersecurity.com/.*'] = {'takeover': 'never'}
" , div[role="textbox"], div[id="codewindow"], div[class="ace_editor"], div[class="ace_content"]
