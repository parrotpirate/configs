" PLUGINS
source $HOME/.vim/config/plug.vimrc

" GENERAL SETTINGS
source $HOME/.vim/config/general.vimrc

" COMMANDS
source $HOME/.vim/config/commands.vimrc

" KEY MAPPINGS
source $HOME/.vim/config/keys.vimrc

" PLUGIN SETTINGS/MAPPINGS
source $HOME/.vim/config/airline.vimrc
source $HOME/.vim/config/easy_motion.vimrc
" source $HOME/.vim/config/vim_flash.vimrc
source $HOME/.vim/config/vim_yoink.vimrc
source $HOME/.vim/config/vim_cutlass.vimrc
source $HOME/.vim/config/vim_subversive.vimrc
source $HOME/.vim/config/lexical.vimrc
source $HOME/.vim/config/markdownpreview.vimrc
source $HOME/.vim/config/multi_cursor.vimrc
source $HOME/.vim/config/nerdtree.vimrc
source $HOME/.vim/config/syntastic.vimrc
source $HOME/.vim/config/ctrlp.vimrc
source $HOME/.vim/config/tabular.vimrc
source $HOME/.vim/config/incsearch.vimrc
source $HOME/.vim/config/vim_slash.vimrc
source $HOME/.vim/config/vim_commentary.vimrc
source $HOME/.vim/config/vim_checkbox.vimrc
source $HOME/.vim/config/vim_pandoc.vimrc
source $HOME/.vim/config/table_mode.vimrc
source $HOME/.vim/config/pandoc.vimrc
source $HOME/.vim/config/hop_conf.vimrc

if !exists('g:vscode')
  source $HOME/.vim/config/indent_guides.vimrc
  source $HOME/.vim/config/supertab.vimrc
  source $HOME/.vim/config/todo.vimrc
endif

" NEOVIM PLUGIN CONFIG/MAPPING
if has ('nvim')
  source $HOME/.vim/config/firenvim.vimrc
  source $HOME/.vim/config/deoplete.vimrc
  source $HOME/.vim/config/multi_cursor.vimrc
  source $HOME/.vim/config/ultisnips.vimrc
endif

" VSCODE NEOVIM INTEGRATION
if exists('g:vscode')
  source $HOME/.vim/config/vscode_neovim.vimrc
endif
