" GENERAL SETTINGS
set nocompatible
set hidden
set shell=/bin/zsh
filetype plugin on

" SET TAB WIDTH
set expandtab
set shiftwidth=2
set softtabstop=2
set number
set clipboard=unnamed
set mouse=
set smartcase

if !exists('g:vscode')
  if (has("termguicolors"))
   set termguicolors
  endif
  syntax enable
  syntax on
endif

let mapleader = ","
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
let g:mkdp_command_for_global = 1

" SET COLOR SCHEME
if !exists('g:vscode')
  colorscheme dracula
  hi! Normal ctermbg=NONE guibg=NONE
  hi! NonText ctermbg=NONE guibg=NONE
  hi! Comment guifg=orange

" Enable cursor line position tracking:
  set cursorline
" Remove the underline from enabling cursorline:
  hi! clear CursorLine
" Set line numbering to red background:
  hi! CursorLineNR guifg=lime
endif

" INTEGRATED TERMINAL CONFIG
" open new split panes to right and below
if !exists('g:vscode')
  set splitright
  set splitbelow
  " start terminal in insert mode
  au BufEnter * if &buftype == 'terminal' | :startinsert | endif
endif
