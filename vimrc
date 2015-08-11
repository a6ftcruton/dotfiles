" ========= VUNDLE (Vim Bundle / Plugin Manager) ========
" —————— From https://github.com/gmarik/Vundle.vim ——————

set nocompatible              " required
filetype off                  " required

" ———————————————————————  PLUGINS  ———————————————————————
set rtp+=~/.vim/bundle/Vundle.vim             " set the runtime path to include Vundle and initialize
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'

Plugin 'L9'                                    

Plugin 'git://git.wincent.com/command-t.git'   

Plugin 'scrooloose/nerdtree.git'

Plugin 'scrooloose/syntastic'

Plugin 'flazz/vim-colorschemes'
 
Plugin 'kien/ctrlp.vim'
 
Plugin 'tpope/vim-commentary'
  
Plugin 'leshill/vim-json'
 
Plugin 'pangloss/vim-javascript'
 
Plugin 'indenthtml.vim'
 
Plugin 'tpope/vim-markdown'

Plugin 'fatih/vim-go'

Plugin 'rking/ag.vim'

Plugin 'bling/vim-airline'

Plugin 'thoughtbot/vim-rspec'

Plugin 'tpope/vim-dispatch'

 Plugin 'SirVer/ultisnips'

 Plugin 'honza/vim-snippets'

 Plugin 'nathanaelkane/vim-indent-guides'
 
 Plugin 'kchmck/vim-coffee-script'

 Plugin 'mustache/vim-mustache-handlebars'

 Plugin 'sjl/gundo.vim'

" ——————————————————————— END Plugins ———————————————————————
call vundle#end()            " required
filetype plugin indent on    " required
"
" Vundle help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ

" ========================================================
" ==================== Custom Settings ===================
" ========================================================
let mapleader = ","

" Modified from thrasher beginner.vimrc
"   v0.1 2012-10-22 Philip Thrasher

syntax on         " Syntax highlighting
 
set cursorline    " highlights current cursor line
set showmatch     " highlights matching bracket(s), cursor, etc.
set wildmenu      " visual autocomplete for command menu
set tabstop=2
set shiftwidth=2
set expandtab     " use spaces instead of tabs.
set smarttab      " let's tab key insert 'tab stops', and bksp deletes tabs.
set shiftround    " tab / shifting moves to closest tabstop.
set autoindent    " Match indents on new lines.
set smartindent   " Intellegently dedent / indent new lines based on rules.
set backspace=indent,eol,start

" To ignore plugin indent changes, instead use: 
  "filetype plugin on
 
" Make search more sane
set ignorecase    " case insensitive search
set smartcase     " If there are uppercase letters, become case-sensitive.
set incsearch     " live incremental searching
set hlsearch      " highlight matches
set gdefault      " use the `g` flag by default.
noremap <leader><space> :nohlsearch<CR> 
vnoremap // y/<C-R>"<CR>

" Movement
" allow the cursor to go anywhere in visual block mode.
"
set virtualedit+=block
nnoremap B ^
nnoremap E $
" create new vsplit, and switch to it.
noremap <leader>v <C-w>v
 
" Navigating Split Windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" So we don't have to reach for escape to leave insert mode.
inoremap jf <esc>

" So we don't have to press shift when we want to get into command mode.
nnoremap ; :
vnoremap ; :

runtime macros/matchit.vim
"insert and remove comments in visual and normal mode
vmap ,ic :s/^/#/g<CR>:let @/ = ""<CR>
map  ,ic :s/^/#/g<CR>:let @/ = ""<CR>
vmap ,rc :s/^#//g<CR>:let @/ = ""<CR>
map  ,rc :s/^#//g<CR>:let @/ = ""<CR>

set clipboard=unnamed " requires x11 support
set relativenumber
set nobackup
set nowritebackup
set noswapfile
" sets p to paste formatted text
map <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>

"Splits windows naturally: to the right or below current window
set splitbelow
set splitright

let g:rspec_command = "!rspec --color {spec}"
" ================ Thoughtbot/vim-rspec =================
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" =====================   NERDTree   =====================
" Trigger configuration. Do not use <tab> if 
" you use https://github.com/Valloric/YouCompleteMe.
 let g:UltiSnipsExpandTrigger="<tab>"
 let g:UltiSnipsJumpForwardTrigger="<c-b>"
 let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" =====================   NERDTree   =====================

map <C-n> :NERDTreeToggle<CR>   
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let NERDTreeShowHidden=1

" =====================   Color Scheme   =====================
colorscheme Tomorrow-Night-Eighties

 " ====== Colors for Indent Guides ====== "

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=23
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=236

 " ====== Search Highlight ====== "
 hi Search cterm=NONE ctermfg=grey ctermbg=blue

 "======  gundo =======
 nnoremap <F5> :GundoToggle<CR>
 
 "====== mustache-handlebars ======= "
let g:mustache_abbreviations = 1

" ===== syntastic ===== "
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
