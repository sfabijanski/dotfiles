"set nocompatible needs to be the first uncommented line
set nocompatible    "be iMproved ??
filetype off        " required!





" use set hidden so I can open multiple unsaved file buffers
" into the same window with :enew. otherwise :enew! would delete
" the current unsaved buffer
set hidden

" remember that b# returns you to the last buffer you were editing


" Begin Vundle setup
" set rtp+=~/.vim/bundle/vundle
" call vundle#rc()

" this setup allows us to work in both windows and linux
let win_shell = (has('win32') || has('win64')) && &shellcmdflag =~ '/'
let vimDir = win_shell ? '$HOME/vimfiles' : '$HOME/.vim'
let &runtimepath .= ',' . expand(vimDir . '/bundle/Vundle.vim')
call vundle#begin(expand(vimDir . '/bundle'))

" let Vundle manage Vundle
" its required! to start with vundle
Plugin 'gmarik/vundle'

" My Bundles go here:
"
" links to original repos on github
" Plugin 'majutsushi/tagbar'
Plugin 'altercation/vim-colors-solarized'
Plugin 'shinokada/listtrans.vim'
Plugin 'atweiden/vim-dragvisuals'
Plugin 'atweiden/vim-betterdigraphs'
Plugin 'atweiden/vim-vmath'
Plugin 'airblade/vim-gitgutter'
Plugin 'kien/ctrlp.vim'
Plugin 'jelera/vim-javascript-syntax'

Plugin 'scrooloose/nerdtree.git'
" setup a shortcut for nerdtree
noremap <Leader>nt :NERDTreeToggle<CR>

Plugin 'scrooloose/syntastic.git'
" helps for linting of various files
" will need to have the appropriate linters installed on system
" see here: https://github.com/scrooloose/syntastic

Plugin 'scrooloose/nerdcommenter'

Plugin 'bling/vim-airline'
set laststatus=2
let g:airline_powerline_fonts = 1

" let g:airline_symbols.space="\ua0"
" if airline is running, allow it to display buffers at the top (in a list)
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

  " unicode symbols
  let g:airline_left_sep = '»'
  let g:airline_left_sep = '▶'
  let g:airline_right_sep = '«'
  let g:airline_right_sep = '◀'
  let g:airline_symbols.linenr = '␊'
  let g:airline_symbols.linenr = '␤'
  let g:airline_symbols.linenr = '¶'
  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.paste = 'Þ'
  let g:airline_symbols.paste = '∥'
  " let g:airline_symbols.whitespace = 'Ξ'
  let g:airline_symbols.whitespace = "\ua0"
  let g:airline_symbols.space = "\ua0"

" to close brackets, parens, and similar
Plugin 'Townk/vim-autoclose'


" Github repos fo the user 'vim-scripts'
" => can omit the username part
" Plugin 'L9'
" Plugin 'FuzzyFinder'
Plugin 'closetag.vim'

" non github repos
" Plugin 'git://git.wincent.com/command-t.git'

call vundle#end()
filetype plugin indent on   " required!
" this is the end of the Vundle setup


if has("gui_running")
    " GUI is running or is about to start.
    " Maximzie gvmim window
    set lines=999 columns=999
endif


set number numberwidth=5
set ruler

" set some search parameters
set incsearch
set ignorecase
set smartcase


set tabstop=4 shiftwidth=4 smarttab expandtab
set autoindent
set smartindent


syntax on
set showmatch "for brackets/braces

" enable the mouse
set mouse=a
" set the ttymouse to xterm (or xterm2??)
set ttymouse=xterm2
" Allow mouse context menus
set mousemodel=popup


" don't bell or blink
set noerrorbells
set vb t_vb=


" Setup the editor colors
"colorscheme desert
set background=dark
colorscheme solarized
set guifont=Monospace\ 12
set cursorline
hi CursorLine cterm=none ctermbg=darkgray ctermfg=yellow guifg=black guibg=steelblue
hi Cursor guifg=yellow guibg=black


" setup text wrap
:nmap \w :setlocal wrap!<CR>:setlocal wrap?<CR>


" kickstart 256 colors terminals -- coverage when we are  using vim in a term
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
endif


" Some tab switch bindings
:nmap \t4 :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
:nmap \t8 :set expandtab tabstop=8 shiftwidth=8 softtabstop=4<CR>
:nmap \m4 :set noexpandtab tabstop=8 softtabstop=4 shiftwidth=4<CR>
:nmap \t2 :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>

" Mappings
" dash moves line down
map - ddp
map <space> viw


" Settings TAB for switching between splitted windows
map <Tab> <C-W>w
map <S-Tab> <C-W>p

" delete white space 
nnoremap <Leader>rws :%s/\s\+$//e<CR>

" copying and pasting
noremap <Leader>y "+y
noremap <Leader>Y "+Y
noremap <Leader>p "+p



" execute the current line in base and insert the standard out
" into the file. Ctrl-u will undo
" try 'wget -qO- http://www.google.com'
noremap <Leader>rb !!bash<CR>


" setup a session when closing vim
autocmd VimLeave * :mksession!

" address white space
" *****************************
" show whitespace 
match ErrorMsg '\s\+$'







" put a vertical line in the 80th column
if exists('+colorcolumn')
  set colorcolumn=80
  highlight ColorColumn ctermbg=grey guibg=lightblue
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

if has("autocmd") && exists("omnifunc")
    autocmd Filetype *
    \ if &omnifunc == "" |
    \   setlocal omnifunc=syntaxcomplete#Complete |
    \ endif
endif

