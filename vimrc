" VIM setting

""" Setting up NeoBundle - the vim plugin bundler
" Modified from
" http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
" This part will install neobundle at the first time to start vim editor
  let neobundle_readme=expand('~/.vim/bundle/neobundle.vim/README.md')
  if !filereadable(neobundle_readme)
      echo "Installing NeoBundle.."
      echo ""
      silent !mkdir -p ~/.vim/bundle
      silent !git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
  endif

  set rtp+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle/'))

""" Setup NeoBundle to manage bundles
  NeoBundleFetch 'Shougo/neobundle.vim'

  " Add bundles here:
  " NeoBundle 'flazz/vim-colorschemes'
  " Or you can specify revision/branch/tag.
  " NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

  """ UI
  " flazz/vim-colorschemes :
  NeoBundle 'flazz/vim-colorschemes'
  " hukl/Smyck-Color-Scheme
  " NeoBundle 'hukl/Smyck-Color-Scheme/'
  " test 256 color, use :XtermColorTable to run. Only turn this on when needed
  " NeoBundle 'guns/xterm-color-table.vim'
  " vim-airline : Lean & mean status/tabline for vim that's light as air.
  NeoBundle 'bling/vim-airline'

  """ Edit
  " Intelligent autocompletion for quotes, parenthesis, brackets
  NeoBundle 'Raimondi/delimitMate'
  " Lokaltog/vim-easymotion
  " NeoBundle 'Lokaltog/vim-easymotion'
  " LnL7/vim-tslime : send portion of text from a vim buffer to a running tmux
  " session
  NeoBundle 'LnL7/vim-tslime'
  " scrooloose/nerdcommenter : make comment lines/blocks of codes easier
  NeoBundle 'scrooloose/nerdcommenter'
  " SuperTab : Do all your insert-mode completion with Tab
  NeoBundle 'ervandew/supertab'

  """ General helper
  "" Filesystem/File/Buffer
  " Shougo/unite.vim : search and display information from arbitrary sources
  " (file, buffers, recently used files .. )
  " Guide: http://usevim.com/2013/06/19/unite/
  NeoBundle 'Shougo/unite.vim'
  " scrooloose/nerdtree : explore filesystems
  NeoBundle 'scrooloose/nerdtree'
  " majutsushi/tagbar : browsing the tags of source code files
  " NeoBundle 'majutsushi/tagbar'
  " csv.vim : display pretty csv file
  NeoBundle 'csv.vim'
  " Twinside/vim-cuteErrorMarker : mark compilation errors
  " NeoBundle 'Twinside/vim-cuteErrorMarker
  " airblade/vim-gitgutter : show signs on modified lines
  " NeoBundle 'airblade/vim-gitgutter'
  " mhinz/vim-signify : uses signs to indicate modified lines base on vcs
  NeoBundle 'mhinz/vim-signify'

  """ Programming language specific
  " General
  " scrooloose/syntastic :  syntax checking
  NeoBundle 'scrooloose/syntastic'
  " garbas/vim-snipmate : textual snippets
  " NeoBundle 'garbas/vim-snipmate'

  " Python
  " pyflakes : Liniting for python files
  " NeoBundle 'kevinw/pyflakes-vim'
  " NeoBundle 'davidhalter/jedi-vim'
  " tell-k/vim-autopep8 : applies autopep8 to current file by :Autopep8
  NeoBundle 'tell-k/vim-autopep8'
  
  " If there are uninstalled bundles found on startup,
  " this will conveniently prompt you to install them.
  NeoBundleCheck

" ----------------------- NeoBundle setup end

" This should get best indenting for most common filetypes
filetype indent plugin on

"""""""""
" General
"""""""""

syntax enable

set nocompatible

"" TAB setting 
  set expandtab
  set softtabstop=2
  set tabstop=2
  set shiftwidth=2

  autocmd FileType python,java setlocal shiftwidth=4 tabstop=4
" ----------------------- TAB setting end

set nocompatible

set tags=tags;/

"" searching
  set incsearch                 " incrimental search
  set hlsearch                  " highlighting when searching

"" terminal color settings
  set term=xterm-256color
  colorscheme jellybeans

set autoindent

set smarttab

set backspace=2

" display
set list                    " show/hide tabs and EOL chars
set number                    " show/hide line numbers (nu/nonu)
set scrolloff=5               " scroll offsett, min lines above/below cursor
set scrolljump=5              " jump 5 lines when running out of the screen
set sidescroll=10             " minumum columns to scroll horizontally
set showcmd                   " show command status
set showmatch                 " flashes matching paren when one is typed
set showmode                  " show editing mode in status (-- INSERT --)
set ruler                     " show cursor position
set cursorline

" code folding
set nofen
set foldmethod=indent         " indent based folding

" other
set noerrorbells              " no bells in terminal
set undolevels=1000           " number of undos stored
set viminfo='50,"50           " '=marks for x files, "=registers for x files

"
" things you may be interested in for your .vimrc
"

" highlight literal tabs
"match Error '\t'

""" Key mapping
" make split windows easier to navigate
"map <C-j> <C-w>j
"map <C-k> <C-w>k
"map <C-h> <C-w>h
"map <C-l> <C-w>l
"map <C-m> <C-w>_
" delete current word, insert and normal modes
inoremap <C-d> <C-O>b<C-O>dw

" bind "gb" to "git blame" for visual and normal mode.
:vmap gb :<C-U>!git blame % -L<C-R>=line("'<") <CR>,<C-R>=line("'>") <CR><CR>
:nmap gb :!git blame %<CR>

" start to load syntax from the beginning of a file
autocmd BufEnter * :syntax sync fromstart

" start at the last edit position
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif
