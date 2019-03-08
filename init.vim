""""VIM SETTINGS""""

syntax on
filetype off                  " Required

set nu
"set rnu
set hidden
set tabstop=4
set expandtab
set autoindent
set scrolloff=8
set nocompatible              " Required
set shiftwidth=4
set laststatus=2
set statusline+=%*
set statusline+=%#warningmsg# 
set backspace=indent,eol,start

""""PLUGINS""""

call plug#begin('~/.vim/plugged')
"Apperance
Plug 'morhetz/gruvbox'
Plug 'bling/vim-airline'
Plug 'bling/vim-bufferline'
"Misc
Plug 'vim-scripts/gitignore'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
Plug 'w0rp/ale'
"Plug 'ludovicchabant/vim-gutentags'
"Code Selection/Navigation
"Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'unblevable/quick-scope'
Plug 'Shougo/deoplete.nvim'
Plug 'junegunn/vim-slash'
"Plug 'kassio/neoterm'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
"Plug 'Shougo/denite.nvim'
"Language specific plugs
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'wting/rust.vim', {'for': 'rust'}
Plug 'lambdatoast/elm.vim', {'for': 'elm'}
Plug 'racer-rust/vim-racer', {'for': 'rust'}
Plug 'elixir-lang/vim-elixir', {'for': 'elixir'}
Plug 'slashmili/alchemist.vim', {'for': 'elixir'}
Plug 'jelera/vim-javascript-syntax', {'for': ['javascript', 'vue']}
Plug 'posva/vim-vue', {'for': 'vue'}
"Plug 'davidhalter/jedi-vim', {'for': 'python'}
Plug 'shime/vim-livedown', {'for': 'markdown'}
call plug#end()

""""PLUGIN SETTINGS""""

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "<tab>"
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "<s-tab>"

"neoterm
"nnoremap <silent> <f1> :TREPLSendSelection<cr>
"nnoremap <silent> <f2> :TREPLSendFile<cr>
"nnoremap <silent> <f12> :Topen<cr>
"nnoremap <silent> <f11> :Tclose!<cr>
"nnoremap <silent> <f12> :Ttoggle<cr>

"let g:neoterm_direct_open_repl = 1
"let g:neoterm_autoinsert = 1
"let g:neoterm_size = 16

nnoremap <silent> <f12> :terminal python3<CR>

""""Apperance""""

colorscheme gruvbox
set background=dark

""""FUNCTIONS""""

"Turn relative numbering on and off
function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber
    else
        set relativenumber
    endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

""""MAPPINGS""""

let mapleader = "\<Space>"
"nnoremap <Leader><tab> :bn<CR>
nmap <C-l> :bn<CR>
nmap <C-h> :bp<CR>

"FZF 'Open' Files - Git Files and Local Files
nnoremap <Leader>o :GFiles<CR>
nnoremap <Leader>O :Files<CR>

"FZF Lines - Buffer Lines and Project Lines
nnoremap <Leader>i :BLines<CR>
nnoremap <Leader>I :Lines<CR>

"FZF Tags - Buffer Tags and Project Tags
nnoremap <Leader>t :BTags<CR>
nnoremap <Leader>T :Tags<CR>

"Jump 10 lines at a time
nmap <C-j> 10jzz
nmap <C-k> 10kzz

" Jumping paragraphs at a time
"nmap <C-j> }  
"nmap <C-k> {

"Jump to beginning or end of a line
"nmap <C-h> ^
"nmap <C-l> $

"Tag remaping
"nmap <C-a> <C-t>
"nmap <C-s> g<C-]>

"Toggle Tagbar
nmap <C-t> :TagbarToggle<CR>

"neovim terminal
tnoremap <Esc> <C-\><C-N>
