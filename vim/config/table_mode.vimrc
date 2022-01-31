" TABLE MODE PLUGIN CONFIG
let g:table_mode_corner='|'
let g:table_mode_align_char=':'

command! TableModeAlignLeft s/|-/|:-/g | noh

nnoremap <leader>tal :TableModeAlignLeft <cr>

