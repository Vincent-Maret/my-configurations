": ----------------
" Automatic vim-plug installation
" ----------------

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ----------------
" Plugins
" ----------------

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.

" Nerdtree used to access a file tree into vim
Plug 'preservim/nerdtree'
" Plugin for Dockerfile syntax highlighting
Plug 'ekalinin/Dockerfile.vim'
" Eslint for VIM
Plug 'dense-analysis/ale'
" Formatter
Plug 'Chiel92/vim-autoformat'
" CTRL P
Plug 'kien/ctrlp.vim'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" ----------------
" General settings
" ----------------

set nocompatible
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch
set tabstop=2
set shiftwidth=2
set expandtab
set relativenumber
set rnu
set background=dark

syntax on

" Switch cursor for insert mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"


" ----------------
" Plugin specific settings
" ----------------

" NERDTREE
" Bindings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" show hidden files
let NERDTreeShowHidden=1

" AUTOFORMAT
" format on save
au BufWrite * :Autoformat

" CTRLP conf
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
