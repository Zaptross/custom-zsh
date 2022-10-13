set number
set autoindent
set tabstop=2
set shiftwidth=2
set ls=2
set scrolloff=5
let mapleader=" "
:nmap <leader>O O<Esc>
:nmap <leader>o o<Esc>
:nmap <leader>J yyp
:nmap <leader>K yyP
:nmap <leader>k ddP
:nmap <leader>j ddp
:imap jk <Esc>

:nmap <leader>cs :s/^/\/\//<Esc><Esc>
:nmap <leader><leader>cs :s/\/\/// <Esc><Esc>
:nmap <leader>ch :s/^/# /<Esc><Esc>
:nmap <leader><leader>ch :s/# /<Esc><Esc>

:nmap <leader>%f :Vex<Return>
:nmap <leader>%t :vert term<Return>
:nmap <leader>"f :Sex<Return>
:nmap <leader>"t :term<Return>
:nmap <C-h> <C-w>h
:nmap <C-j> <C-w>j
:nmap <C-k> <C-w>k
:nmap <C-l> <C-w>l
