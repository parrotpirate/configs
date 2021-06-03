" vim-plug setup
call plug#begin('/Users/stevep/.vim' . '/plugged')
  function! Cond(cond, ...)
    let opts = get(a:000, 0, {})
    return a:cond ? opts : extend(opts, { 'on': [], 'for': [], 'do': [] })
  endfunction

  function! Conda(Cond, ...)
    let opts = get(a:000, 0, {})
    return a:Cond ? opts : extend(opts, { 'on': [], 'for': [] })
  endfunction

  " NEOVIM PLUGINS
  Plug 'Shougo/deoplete.nvim', Cond(has('nvim'), { 'do': ':UpdateRemotePlugins' })
  Plug 'iamcco/markdown-preview.nvim', Cond(has('nvim'), { 'do': 'cd app & yarn install'  })
  Plug 'SirVer/ultisnips', Cond(has('nvim'))
  Plug 'glacambre/firenvim', Cond(has('nvim'), { 'do': { _ -> firenvim#install(0) } })
  Plug 'easymotion/vim-easymotion', Conda(!exists('g:vscode'))
  Plug 'asvetliakov/vim-easymotion', Conda(exists('g:vscode'), { 'as': 'vsc-easymotion' })

  " VIM PLUGINS
  Plug 'honza/vim-snippets'
  Plug 'machakann/vim-sandwich'
  Plug 'plasticboy/vim-markdown'
  Plug 'tridactyl/vim-tridactyl'
  Plug 'svermeulen/vim-subversive'
  Plug 'svermeulen/vim-yoink'
  Plug 'svermeulen/vim-cutlass'
  Plug 'tpope/vim-repeat'
  Plug 'triglav/vim-visual-increment'
  Plug 'junegunn/vim-slash'
  " Plug 'scrooloose/nerdcommenter'
  " Plug 'tomtom/tcomment_vim'
  Plug 'reedes/vim-lexical'
  Plug 'inkarkat/vim-ingo-library'
  Plug 'inkarkat/vim-visualrepeat'
  Plug 'inkarkat/vim-spellcheck'
  Plug 'reedes/vim-litecorrect'
  Plug 'vim-pandoc/vim-pandoc'
  Plug 'vim-pandoc/vim-pandoc-syntax'
  " Plug 'townk/vim-autoclose'
  Plug 'sheerun/vim-polyglot'
  Plug 'ervandew/supertab'
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'PhilRunninger/nerdtree-visual-selection'
  Plug 'ryanoasis/vim-devicons'
  Plug 'tpope/vim-fugitive'
  Plug 'vim-airline/vim-airline'
  Plug 'scrooloose/syntastic'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'godlygeek/tabular'
  Plug 'mattn/emmet-vim'
  Plug 'raimondi/delimitmate'
  Plug 'haya14busa/incsearch.vim'
  Plug 'haya14busa/incsearch-fuzzy.vim'
  Plug 'haya14busa/incsearch-easymotion.vim'

  " Don't use these with VSCode
if !exists('g:vscode')
  Plug 'airblade/vim-gitgutter'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'tpope/vim-commentary'
  " Plug 'easymotion/vim-easymotion'
endif

if exists('g:vscode')
endif
  " THEMES
  Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'sainnhe/edge', { 'as': 'edge' }

  " DISABLED
call plug#end()
