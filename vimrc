" Put environment dependent vimrc here
"

syntax enable

set nocompatible

set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab

"
" general
"

set nocompatible

set tags=tags;/

" searching
set incsearch                 " incrimental search
set hlsearch                  " highlighting when searching

" this should get best indenting for most common filetypes
filetype indent plugin on
" note: cindent and smartindent do the wrong thing with e.g. indented lines
" starting with # in certain files.
" so i think autoindent is more minimal and good default for all filetypes.
" again, most files will be covered by the previous line.
set autoindent

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

" make split windows easier to navigate
"map <C-j> <C-w>j
"map <C-k> <C-w>k
"map <C-h> <C-w>h
"map <C-l> <C-w>l
"map <C-m> <C-w>_

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
