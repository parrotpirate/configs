" COMMANDS
" Clear all lines
command! Cl 1,$d
" Clear all empty lines
command! Cel g/^\s*$/d
" Update plugins
command! PU PlugUpdate | PlugUpgrade
command! PI PlugInstall

" OPEN TERMINAL ON CTRL+N
function! OpenTerminal()
  split term://bash
  resize 10
endfunction

" Strip a URL down to the root domain
command! Stripdomain s#^http[s]\=:\/\/[w]\{,3}[.]\=\([^.]\+\.\l\+\).*#\1# | yank

" Strip a URL down to the site name
command! Stripname s#^http[s]\=:\/\/[w]\{,3}[.]\=\([^.]\+\)\..*#\1# | yank

" Quote each line for Jira response.
command! JiraResponse %s/^[^\n].*$/> &\r\r+ /g

" Convert to HTML because Microsoft Teams sucks
command! TC silent write | let @+ = system("pandoc -t html " . shellescape(expand("%:p")))

" VSCode commands
if exists('g:vscode')
  command! -bang Showcommands call VSCodeNotify('workbench.action.showCommands')

  AlterCommand sc Showcommands
endif
