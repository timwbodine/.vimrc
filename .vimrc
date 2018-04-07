set nocompatible              " required
filetype off                  " required
syntax on
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
"split navigations
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'tmhedberg/SimpylFold'
Plugin 'milkypostman/vim-togglelist'
" Track the engine.
Plugin 'SirVer/ultisnips'
Plugin 'pangloss/vim-javascript' 
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:UltiSnipsExpandTrigger="<c-j>"
let g:ulti_expand_or_jump_res = 0
function ExpandSnippetOrCarriageReturn()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return snippet
    else
        return "\<CR>"
    endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
set completeopt-=preview

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
call vundle#end()            " required
filetype plugin indent on    " required
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
nmap <F6> :NERDTreeToggle<CR>
colorscheme afterglow
let python_highlight_all=1
syntax on
set nu
set encoding=utf-8

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Remember last position in file.
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif
" use system clipboard
set clipboard=unnamed
" put things removed with d in blackhole register
nnoremap d "_d
vnoremap d "_d
set splitbelow
set splitright

" Enable folding
set foldmethod=indent
set foldlevel=99
set ruler
nnoremap <space> za

augroup AutoSaveFolds
autocmd!
autocmd BufWinLeave * mkview
autocmd BufWinEnter * silent loadview
augroup END
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
au BufRead,BufNewFile *.md setlocal textwidth=80 formatoptions=t1
highlight BadWhitespace ctermbg=red guibg=darkred

