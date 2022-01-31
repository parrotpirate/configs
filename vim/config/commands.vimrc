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
" command! JiraResponse %s/^\n\=\s*\(.*\)[^\n]$/> \1\r\r+ \r/g | %s#\($\n\s*\)\+\%$## | noh | call cursor(3,2)
command! JiraResponse %s/^\n\=\s\=\([^\n]\+\)/> \1\r\r+\r/g | %s#\($\n\s*\)\+\%$## | noh | call cursor(3,2)

" Convert to HTML because Microsoft Teams sucks
command! TC silent write | let @+ = system("pandoc -t html " . shellescape(expand("%:p")))

" Convert to branch name
command! BN silent %s/.*/\L&/g | %s/\s/-/g | %s/[-]*$//g | yank

function! BufferDeleteOrQuit()
  let bufferCount = len(getbufinfo({'buflisted':1}))
  if bufferCount > 1
    bdelete
  else
    quit!
  endif
endfunction

command! BufferDeleteOrQuit call BufferDeleteOrQuit()

" function! SyntasticToggle()
"   let g:syntastic_is_open = 0  
"   if g:syntastic_is_open == 1
"       lclose
"       let g:syntastic_is_open = 0 
"   else
"       Errors
"       let g:syntastic_is_open = 1 
"   endif
" endfunction

function! SyntasticToggle()
  let g:wi = getloclist(2, {'winid' : 1})
  if g:wi != {}
    lclose
  else
    SyntasticCheck
  endif
endfunction

function! SyntasticNext()
  let g:wi = getloclist(2, {'winid' : 1})
  if g:wi != {}
    lnext
  endif
endfunction

function! SyntasticPrev()
  let g:wi = getloclist(2, {'winid' : 1})
  if g:wi != {}
    lprevious
  endif
endfunction

command! ST call SyntasticToggle()
command! SN call SyntasticNext()
command! SP call SyntasticPrev()

" SET FILETYPE
if exists('g:started_by_firenvim')
  command! Shtml set filetype=html
  command! Smd set filetype=markdown
endif
