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
set cmdheight=2
set updatetime=300
set shortmess+=c


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
"Plug 'Shougo/deoplete.nvim'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
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
Plug 'cespare/vim-toml', {'for': 'toml'}
call plug#end()

""""PLUGIN SETTINGS""""

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"let g:deoplete#enable_at_startup = 1
"let g:deoplete#enable_smart_case = 1
"inoremap <expr><tab> pumvisible() ? "\<c-n>" : "<tab>"
"inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "<s-tab>"

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

"""COC - COPIED FROM GITHUB EXAMPLE """

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"Use Tab and S-Tab to jump though snippet
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
"autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
"nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

"" Use `:Format` for format current buffer
"command! -nargs=0 Format :call CocAction('format')
"
"" Use `:Fold` for fold current buffer
"command! -nargs=? Fold :call     CocAction('fold', <f-args>)


" Using CocList
" Show all diagnostics
"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
"nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

