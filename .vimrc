set nocompatible " Use Vim settings rather than Vi settings
filetype off

set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8

"______________________________________________________________________________
" Plugins
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'jremmen/vim-ripgrep'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'majutsushi/tagbar'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'tpope/vim-fugitive'
"Plugin 'airblade/vim-gitgutter'
Plugin 'vim-syntastic/syntastic'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'altercation/vim-colors-solarized'
Plugin 'itchyny/lightline.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'morhetz/gruvbox'

call vundle#end()
filetype plugin indent on

"______________________________________________________________________________
" General settings
set number " line number in margin

filetype plugin on
filetype indent on
filetype on
set backspace=indent,eol,start

syntax on
set background=dark
set colorcolumn=81
set termguicolors
colorscheme gruvbox

set ruler
set cursorline
set cmdheight=2 " set command bar to  2 lines high
set hlsearch "  highlight search phrases
set incsearch " highlight as you
set scrolloff=10 " keep 10 lines top & bottom for scope
set noerrorbells " no beeps
set laststatus=2 " always show the status line
set showcmd " display incomplete commands
set nostartofline " keep the cursor in the same column when chaging line


set formatoptions=tcrqn " see :help fo-table
set autoindent
set smartindent
set cindent " C-style indenting
set softtabstop=3 "2 spaces when pressing <tab> unify
set expandtab
set shiftwidth=3

"set ignorecase " ignore case for searches
"set smartcase " ... but use case if any upper case characters are in pattern


"______________________________________________________________________________
" Set tabs defaults for different languages
autocmd FileType python call s:python_settings()
autocmd FileType cpp call s:cpp_settings()

function! s:python_settings()
	set softtabstop=4
	set shiftwidth=4
endfunction

function! s:cpp_settings()
	set softtabstop=2
	set shiftwidth=2
endfunction

"
" vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_no_function_highlight = 1

"
" vim-cpp-enhanced-highlight

let g:lightline = { 'colorscheme': 'wombat', }

"______________________________________________________________________________
" Key mapping

let mapleader=" "

" build
noremap <Leader>b :make<CR>

" save all
noremap <Leader>s :wa<CR>

" exit
noremap <Leader>x :qa!<CR>

" quit
noremap <Leader>q :q!<CR>

" Fuzzy Files
noremap <Leader>f :Files<CR>
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --glob "!tags" --glob "!build/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
noremap <Leader>F :Find

" go RipGrep
noremap <Leader>g :Rg<CR>

" remove highlight
noremap <Leader>h :nohl<CR>

" clang-format
noremap <Leader>k :!clang-format-8 -i %<CR>

command GenerateCtags :! ctags -R --c++-kinds=+p --fields=+iaS .
noremap <Leader>tg :GenerateCtags   <CR>
