set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()          " required

Plugin 'VundleVim/Vundle.vim'

Plugin 'ycm-core/YouCompleteMe'
let g:ycm_enable_inlay_hints = 1

call vundle#end()            " required
filetype plugin indent on    " required

set number
set relativenumber
set autoindent
set tabstop=2
set shiftwidth=2
set ls=2
set scrolloff=5

" Leader configuration
let mapleader=" "
" let mapleader="\<space>"

:nmap <leader>O O<Esc>
:nmap <leader>o o<Esc>
:nmap <leader>J yyp
:nmap <leader>K yyP
:nmap <leader>k ddP
:nmap <leader>j ddp
:imap jk <Esc>

" Comment functions
:nmap <leader>cs :s/^/\/\//<Esc><Esc>
:nmap <leader><leader>cs :s/\/\/// <Esc><Esc>
:nmap <leader>ch :s/^/# /<Esc><Esc>
:nmap <leader><leader>ch :s/# /<Esc><Esc>

" File and terminal splits
:nmap <leader>%f :Vex<Return>
:nmap <leader>%t :vert term<Return>
:nmap <leader>"f :Sex<Return>
:nmap <leader>"t :term<Return>

" Move between windows
:nmap <C-h> <C-w>h
:nmap <C-j> <C-w>j
:nmap <C-k> <C-w>k
:nmap <C-l> <C-w>l

" format the whole file
:nmap <A-F> gg=G

"This allows for change paste motion gr{motion}
nmap <silent> gr :set opfunc=ChangePaste<CR>g@
function! ChangePaste(type, ...)
	silent exe "normal! `[v`]\"_c"
	silent exe "normal! p"
endfunction

" Visual Studio Keybindings
" noremap <leader>rr :vsc Refactor.Rename<Enter>
