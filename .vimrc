" Personal vimrc.
" For a minimal version, remove :
" - Vundle and the plugins (everything above line 27)
" - Pylint related line (line 54)
"
" Last modified on May 10, 2020.
" Stephane Dong


set nocompatible " Don't try to be vi compatible
filetype off " Helps force plugins to load correctly when it is turned back on below

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'davidhalter/jedi-vim' " Python autocompletion
Plugin 'sheerun/vim-polyglot' " Collection of language packs

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

colorscheme monokai " Colorscheme

" Folding
set foldmethod=indent " Folding lines with equal indent
set foldlevel=99 " Folds with a higher level will be closed
nnoremap <space> za

" General stuff
syntax on " Syntax highlighting
set number " Line number
set ruler " Show file stats
set visualbell " Blink cursor on error instead of beeping
set encoding=utf-8 " Encoding
set showmatch " Highlight the matching bracket/parenthesis/brace
set laststatus=2 " Status bar
set autoindent " Vim basic autoindent
set shiftwidth=4 " Size of an indent, measured in spaces.
set tabstop=4 " Width of a tab
set wrap " Wrap lines when longer than window width (no breakline)
set backspace=2 " Make backspace work as in other programs
set expandtab " Make tab key insert spaces instead of tab characters

" Highlights the 80th column
highlight ColorColumn ctermbg=gray 
set colorcolumn=80

" Pylint
autocmd FileType python compiler pylint

" Tree explorer
let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_winsize=25
augroup ProjectDrawer
	autocmd!
	autocmd VimEnter * :Vexplore
	autocmd VimEnter * wincmd w
augroup END

augroup finalcountdown
	au!
	autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw" || &buftype == 'quickfix' |q|endif
	nmap - :Lexplore<cr>
augroup END
