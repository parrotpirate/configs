" NERDTREE SETTINGS
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeNaturalSort = 1
let NERDTreeSortHiddenFirst = 1
let NERDTreeHighlightCursorline = 1
let NERDTreeShowLineNumbers = 1
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
if !exists('g:vscode')
  nmap <silent> <C-e> :NERDTreeToggle<CR>
  nmap <silent> <leader>e :NERDTreeToggle<CR>
endif
