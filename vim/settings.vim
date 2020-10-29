" ========================================================
" ==================== Custom Settings ===================
" ========================================================
let mapleader = ','
inoremap jf <esc>
nnoremap ; :
vnoremap ; :

" Modified from thrasher beginner.vimrc
"   v0.1 2012-10-22 Philip Thrasher
syntax on         " Syntax highlighting
set cursorline    " highlights current cursor line
set showmatch     " highlights matching bracket(s), cursor, etc.
set tabstop=2
set shiftwidth=2
set expandtab     " use spaces instead of tabs.
set shiftround    " tab / shifting moves to closest tabstop.
set smartindent   " Intellegently dedent / indent new lines based on rules.

" Search
set ignorecase    " case insensitive search
set smartcase     " If there are uppercase letters, become case-sensitive.
set hlsearch      " highlight matches
set gdefault      " use the `g` flag by default.
noremap <leader><space> :nohlsearch<CR>

" Movement
set virtualedit+=block
nnoremap B ^
nnoremap E $

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

set clipboard+=unnamedplus
" sets p to paste formatted text
map <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>

set relativenumber
set number norelativenumber " numbertoggle
set nobackup
set nowritebackup
set noswapfile

"Splits windows naturally: to the right or below current window
set splitbelow
set splitright

" Use Ctrl+<direction> to navigate b/w splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Resize splits Split
nnoremap <silent> <Leader>+ :exe 'resize ' . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe 'resize ' . (winheight(0) * 2/3)<CR>

" prevent :autocmd, shell and write commands from being run inside project-specific .vimrc files unless they’re owned by you.
" https://andrew.stwrt.ca/posts/project-specific-vimrc/
set secure
