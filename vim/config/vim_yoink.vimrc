" VIM YOINK SETTINGS
let g:yoinkSyncNumberedRegisters = 1
let g:yoinkMoveCursorToEndOfPaste = 1
let g:yoinkIncludeDeleteOperations = 1
let g:yoinkSwapClampAtEnds = 0
let g:yoinkSyncSystemClipboardOnFocus = 1

" VIM YOINK MAPPINGS
imap <silent><C-v> <esc>pa
nmap <expr> p yoink#canSwap() ? '<plug>(YoinkPostPasteSwapBack)' : '<plug>(YoinkPaste_p)'
nmap <expr> P yoink#canSwap() ? '<plug>(YoinkPostPasteSwapForward)' : '<plug>(YoinkPaste_P)'
nmap <c-=> <plug>(YoinkPostPasteToggleFormat)
