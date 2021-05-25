" VSCode Functions
function! VisualSelectionToLineComment()
  normal! gv
  let visualmode = visualmode()
  if visualmode == "V"
      let startLine = line("v")
      let endLine = line(".")
      call VSCodeNotifyRange("editor.action.commentLine", startLine, endLine, 1)
  else
      let startPos = getpos("v")
      let endPos = getpos(".")
      call VSCodeNotifyRangePos("editor.action.blockComment", startPos[1], endPos[1], startPos[2], endPos[2]+1, 1)
  endif
endfunction

" VSCode Commands
  command! -bang Showcommands call VSCodeNotify('workbench.action.showCommands')
  command! -bang VisualSelectionToLineComment call VisualSelectionToLineComment()
  AlterCommand sc Showcommands

" VSCode mappings
  nnoremap <leader>w <Cmd>Write<cr>
  nnoremap <leader>z <Cmd>Wq<cr>
  nnoremap <leader>q <Cmd>Quit!<cr>
  nnoremap gx <Cmd>Quit!<cr>
  nnoremap <leader>e <Cmd>Edit<cr>
  nnoremap <leader>E <Cmd>Showcommands<cr>
  " xnoremap <leader><leader>c <Cmd>VisualSelectionToLineComment<CR><ESC>
  " unmap gc
  " xmap gc <Cmd>VisualSelectionToLineComment<CR><ESC>
