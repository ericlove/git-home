colorscheme zellner
syntax on " Turn on syntax highligthing
autocmd BufEnter * :syntax sync fromstart

set nocompatible "Not vi compativle (Vim is king)

set laststatus=2
set ruler

" Ctags stufff
set tags=tags;/

""""""""""""""""""""""""""""""""""
" Syntax and indent
""""""""""""""""""""""""""""""""""
set showmatch  "Show matching bracets when text indicator is over them 

" Switch on filetype detection and loads 
" indent file (indent.vim) for specific file types
filetype indent on
filetype on
set autoindent " Copy indent from the row above

""""""""""""""""""""""""""""""""""
" Some other confy settings
""""""""""""""""""""""""""""""""""
" set nu " Number lines
set hls " highlight search
set lbr " linebreak

" Use 2 space instead of tab during format
set expandtab
set shiftwidth=2
set tabstop=2


" ANSI Escape Coloring
" for dealing with BOOM/Chisel output files
autocmd BufNewFile,BufRead *.out call SetOutOpts()
function SetOutOpts()
   source ~/.vim/plugin/AnsiEscPlugin.vim
   setlocal nowrap 
   :AnsiEsc
endfunction
"autocmd BufNewFile,BufRead *.out setlocal nowrap; setlocal AnsiEsc
:set wildmode=longest,list
:set wildmenu

set number
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Python-specific tabstop settings
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
