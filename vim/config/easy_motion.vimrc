" EASY MOTION PLUGIN SETTINGS
let g:EasyMotion_startofline = 0
let g:EasyMotion_smartcase = 1

function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzyword#converter()],
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> <leader><leader>/ incsearch#go(<SID>config_easyfuzzymotion())

" EASY MOTION PLUGIN KEY MAPPINGS
map <silent> <Leader><Leader> <Plug>(easymotion-prefix)
