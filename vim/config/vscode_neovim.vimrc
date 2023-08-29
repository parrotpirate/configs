" VSCode Functions
function! s:visualSelectionToLineComment()
  normal! gv
  let visualmode = visualmode()
  if visualmode == "V"
      let startLine = line("v")
      let endLine = line(".")
      call VSCodeNotifyRange("editor.action.commentLine", startLine, endLine, 1)
  else
      let startPos = getpos("v")
      let endPos = getpos(".")
      call VSCodeNotifyRangePos("editor.action.blockComment", startPos[1], endPos[1], startPos[2], endPos[2], 1)
  endif
endfunction

function! s:openVSCodeCommandsInVisualMode()
    normal! gv
    let visualmode = visualmode()
    if visualmode == "V"
        let startLine = line("v")
        let endLine = line(".")
        call VSCodeNotifyRange("workbench.action.showCommands", startLine, endLine, 1)
    else
        let startPos = getpos("v")
        let endPos = getpos(".")
        call VSCodeNotifyRangePos("workbench.action.showCommands", startPos[1], endPos[1], startPos[2], endPos[2], 1)
    endif
endfunction

" VSCode Commands
  command! -bang Showcommands call VSCodeNotify('workbench.action.showCommands')
  command! -bang Quickopen call VSCodeNotify('workbench.action.quickOpen')
  command! -bang Previousgroup call VSCodeNotify('workbench.action.focusPreviousGroup')
  command! -bang Nextgroup call VSCodeNotify('workbench.action.focusNextGroup')
  command! -bang Movepreviousgroup call VSCodeNotify('workbench.action.moveEditorToLeftGroup')
  command! -bang Movenextgroup call VSCodeNotify('workbench.action.moveEditorToRightGroup')
  command! -bang VisualSelectionToLineComment call VisualSelectionToLineComment()
  command! -bang Fullclose call VSCodeNotify('macros.fullClose')
  command! -bang NextTab call VSCodeNotify('workbench.action.nextEditor')
  command! -bang PreviousTab call VSCodeNotify('workbench.action.previousEditor')
  command! -bang NewTab call VSCodeNotify('workbench.action.files.newUntitledFile')
  command! -bang OpenExplorer call VSCodeNotify('workbench.view.explorer')
  command! -bang ToggleSidebar call VSCodeNotify('workbench.action.toggleSidebarVisibility')
  AlterCommand sc Showcommands

" VSCode mappings
  nnoremap <leader>w <Cmd>Write<cr>
  nnoremap <leader>z <Cmd>Wq<cr>
  nnoremap <leader>q <Cmd>Quit!<cr>
  nnoremap <leader>Q <Cmd>Fullclose<cr>
  nnoremap gx <Cmd>Quit!<cr>
  nnoremap <leader>p <Cmd>Edit<cr>
  nnoremap <leader>p <Cmd>Showcommands<cr>
  nnoremap <leader>e <Cmd>Quickopen<cr>
  nnoremap <leader>E <Cmd>OpenExplorer<cr>
  nnoremap <leader>b <Cmd>ToggleSidebar<cr>
  nnoremap <leader>t <Cmd>NewTab<cr>
  nnoremap <leader>h <Cmd>PreviousTab<cr>
  nnoremap <leader>l <Cmd>NextTab<cr>
  nnoremap <leader>H <Cmd>Previousgroup<cr>
  nnoremap <leader>L <Cmd>Nextgroup<cr>
  nnoremap <leader><leader>h <Cmd>Movepreviousgroup<cr>
  nnoremap <leader><leader>l <Cmd>Movenextgroup<cr>
  " xnoremap <leader>E <Cmd>Showcommands<cr>
  xnoremap <silent> <leader><leader>p :<C-u>call <SID>openVSCodeCommandsInVisualMode()<CR>
  xnoremap <silent> <leader><leader>c :<C-u>call <SID>visualSelectionToLineComment()<CR>
  " unmap gc
  " xmap gc <Cmd>VisualSelectionToLineComment<CR><ESC>
xmap gc  <Plug>VSCodeCommentary
nmap gc  <Plug>VSCodeCommentary
omap gc  <Plug>VSCodeCommentary
nmap gcc <Plug>VSCodeCommentaryLine
