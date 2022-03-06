set number
set autoindent
set tabstop=4
set ls=2
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

:nmap <leader>% :Vex<Return>
:nmap <leader>" :Sex<Return>
:nmap <C-h> <C-w>h
:nmap <C-j> <C-w>j
:nmap <C-k> <C-w>k
:nmap <C-l> <C-w>l