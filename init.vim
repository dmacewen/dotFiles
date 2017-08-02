""""VIM SETTINGS""""

syntax on
filetype off                  " Required

set nu
set rnu
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
Plug 'w0rp/ale'
Plug 'posva/vim-vue'
"Plug 'ludovicchabant/vim-gutentags'
"Code Selection/Navigation
Plug 'scrooloose/nerdtree'
Plug 'unblevable/quick-scope'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/denite.nvim'
Plug 'junegunn/vim-slash'
Plug 'kassio/neoterm'
"Language specific plugs
Plug 'fatih/vim-go'
Plug 'wting/rust.vim'
Plug 'lambdatoast/elm.vim'
Plug 'racer-rust/vim-racer'
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'shime/vim-livedown'
call plug#end()

""""PLUGIN SETTINGS""""

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "<tab>"
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "<s-tab>"

"neoterm
nnoremap <silent> <f1> :TREPLSendSelection<cr>
nnoremap <silent> <f2> :TREPLSendFile<cr>
nnoremap <silent> <f12> :Topen<cr>
nnoremap <silent> <f11> :Tclose!<cr>

let g:neoterm_direct_open_repl = 1
let g:neoterm_autoinsert = 1

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

""""MAPPINGS""""

let mapleader = "\<Space>"
nnoremap <Leader><tab> :bn<CR>
nnoremap <Leader>o :NERDTree<CR>
nnoremap <C-n> :call NumberToggle()<cr>

" Jumping paragraphs at a time
nmap <C-j> }  
nmap <C-k> {

"Jump to beginning or end of a line
nmap <C-h> ^
nmap <C-l> $

"Tag remaping
nmap <C-a> <C-t>
nmap <C-s> g<C-]>

"neovim terminal
tnoremap <Esc> <C-\><C-N>

""""OLD""""

"set rtp+=~/.vim/bundle/Vundle.vim

"let g:ctrlp_use_caching = 0
"let g:ConqueTerm_Color = 2
"let g:ConqueTerm_CloseOnEnd = 1
"let g:ConqueTerm_StartMessages = 0

"let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_check_on_wq = 0
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_always_populate_loc_list = 1
"set statusline+=%{SyntasticStatuslineFlag()}
"Plug 'scrooloose/syntastic'

"nnoremap <Leader>l :SyntasticToggleMode<CR>
"nmap <Leader><Leader> V

"Plug 'Lokaltog/vim-easymotion'
"Plug 'Valloric/YouCompleteMe'
"Plug 'vim-scripts/Conque-GDB'
"Plug 'majutsushi/tagbar'
"Plug 'Raimondi/delimitMate'
"Plug 'christoomey/vim-tmux-navigator'
"Plug 'terryma/vim-expand-region'

"vmap v <Plug>(expand_region_expand)
"vmap <C-v> <Plug>(expand_region_shrink)
"
""""For Ctrl-P, ignore certain files
"if executable('ag')
"        set grepprg=ag\ --nogroup\ --nocolor
"        let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"else
"        let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
"        let g:ctrlp_prompt_mappings = {'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],}
"endif
