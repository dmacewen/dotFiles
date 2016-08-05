set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin('~/.vim/plugged')
Plug 'bling/vim-airline'
Plug 'bling/vim-bufferline'
Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-expand-region'
Plug 'vim-scripts/gitignore'
Plug 'scrooloose/nerdtree'
Plug 'unblevable/quick-scope'
Plug 'jelera/vim-javascript-syntax'
Plug 'morhetz/gruvbox'
Plug 'fatih/vim-go'
Plug 'elixir-lang/vim-elixir'
Plug 'racer-rust/vim-racer'
Plug 'wting/rust.vim'
Plug 'ludovicchabant/vim-gutentags'
"Plug 'Lokaltog/vim-easymotion'
"Plug 'Valloric/YouCompleteMe'
"Plug 'vim-scripts/Conque-GDB'
"Plug 'majutsushi/tagbar'
"Plug 'Raimondi/delimitMate'
"Plug 'christoomey/vim-tmux-navigator'
call plug#end()

" " Put your non-Plugin stuff after this line
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let mapleader = "\<Space>"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:syntastic_javascript_checkers = ['eslint']

let g:ConqueTerm_Color = 2
let g:ConqueTerm_CloseOnEnd = 1
"let g:ConqueTerm_StartMessages = 0

colorscheme gruvbox
set background=dark

function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber
    else
        set relativenumber
    endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

nnoremap <Leader>o :NERDTree<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader><tab> :bn<CR>
nnoremap <Leader>l :SyntasticToggleMode<CR>

nmap <Leader><Leader> V
"Jumping paragraphs at a time
nmap <C-j> }
nmap <C-k> {
"Jump to beginning or end of a line
nmap <C-h> ^
nmap <C-l> $
"Tag remaping
nmap <C-a> <C-t>
nmap <C-s> g<C-]>

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

set scrolloff=8

set statusline+=%#warningmsg# 
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set hidden

set laststatus=2
set backspace=indent,eol,start
set nu
set rnu
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
syntax on

let g:ctrlp_use_caching = 0

if executable('ag')
        set grepprg=ag\ --nogroup\ --nocolor
        let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
        let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
        let g:ctrlp_prompt_mappings = {'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],}
endif
