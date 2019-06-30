autocmd! bufwritepost .vimrc source % 
set nocompatible              " be iMproved, required
filetype off                  " required
set nu
set nowrap
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tmux-plugins/vim-tmux-focus-events'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'jnurmine/Zenburn'
Plugin 'christoomey/vim-tmux-navigator'
"Plugin 'wincent/command-t'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'itchyny/lightline.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { "mode": "active", "active_filetypes": [], "passive_filetypes": [] }

set relativenumber

:map <F2> :echo 'Current time is ' . strftime('%c')<CR>

function! JAVASET()
    :map <F9> :!clear<cr>:w <CR> :!javac % <CR> :!java %:r <CR>
endfunction 

function! PYSET()
    syntax on
    nnoremap <buffer> <F9> :!clear<cr>:w <cr> :!python  % <cr>
    map <buffer> <F10> :w<cr>:!python -i %<cr>
    nnoremap <buffer> <F7> :!clear<cr>:w <cr> :!python3  % <cr>
    map <buffer> <F8> :w<cr>:!python3 -i %<cr>
endfunction 

function! CPPSET()
    noremap <buffer> <F9> :w<cr> :!g++ -o %< % && ./%< <cr>
    noremap <buffer> <F10> :w<cr> :!g++ -o %< % <cr> :!./%< < test.inp <cr>
endfunction 

function! CSET()
    noremap <buffer> <F9> :!clear<cr>:w<cr> :!gcc -o %< % <cr> :!./%<<cr>
    "    noremap <buffer> <F9> :w<cr> :!g++ -o %< % && ./%< <cr>
    setlocal tabstop=8
    setlocal shiftwidth=8
    setlocal softtabstop=8
    setlocal textwidth=100
    setlocal noexpandtab
    setlocal foldmethod=syntax
endfunction 


function! My_Tab_Completion()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-P>"
    else
        return "\t"
endfunction
inoremap <Tab> <C-R>=My_Tab_Completion()<CR>
set expandtab
set copyindent
set preserveindent
set softtabstop=0
set shiftwidth=4
set tabstop=4
set fileformat=unix

set clipboard=unnamedplus
set mouse=a
set bs=2
let mapleader = ","
set hlsearch
syntax on 
set incsearch
""set ignorecase
set smartcase
set undofile                 "turn on the feature  
set undodir=$HOME/.vim/undo
set nolist
"set list
"set listchars=tab:>-
set tags=./tags,tags,./.tags,.tags

autocmd FileType python call PYSET()
autocmd FileType java call JAVASET()
autocmd FileType cpp call CPPSET()
autocmd FileType CPP call CPPSET()
autocmd FileType C call CSET()
autocmd FileType c call CSET()
hi Search ctermbg=18
set autoread
au FocusGained,BufEnter * :silent! !
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview 

"ctrlp option
set runtimepath^=~/.vim/bundle/ctrlp.vim
nnoremap <leader>t :CtrlPTag<cr>
let g:ctrlp_working_path_mode = 'w'


set laststatus=2 "for lightline-vim
"set color of syntastic check
hi SpellBad ctermfg=124 ctermbg=154 
hi SpellCap ctermfg=124 ctermbg=154
" hot fix

