" ========= VUNDLE (Vim Bundle / Plugin Manager) ========
" —————— From https://github.com/gmarik/Vundle.vim ——————

set nocompatible              " required
filetype off                  " required

" ———————————————————————  PLUGINS  ———————————————————————
set rtp+=~/.vim/bundle/Vundle.vim             " set the runtime path to include Vundle and initialize
call vundle#begin()

Plugin 'rking/ag.vim'
Plugin 'git://git.wincent.com/command-t.git'   
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree.git'
Plugin 'SirVer/ultisnips'
Plugin 'flazz/vim-colorschemes'
Plugin 'gmarik/Vundle.vim'
Plugin 'honza/vim-snippets'
Plugin 'indenthtml.vim'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'pangloss/vim-javascript'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'cohama/lexima.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'christoomey/vim-tmux-runner' "have to manually add to .vim/bundle
Plugin 'gabebw/vim-spec-runner'
" Plugin 'scrooloose/syntastic'

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
set virtualedit+=block
nnoremap B ^
nnoremap E $

" create new vsplit, and switch to it.
noremap <leader>v <C-w>v

"allow vim and tmux pane navigation to play nicely together
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-H> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-J> :TmuxNavigateDown<cr>
nnoremap <silent> <C-K> :TmuxNavigateUp<cr>
nnoremap <silent> <C-L> :TmuxNavigateRight<cr>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>

" So we don't have to reach for escape to leave insert mode.
inoremap jf <esc>

" So we don't have to press shift when we want to get into command mode.
nnoremap ; :
vnoremap ; :

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

runtime macros/matchit.vim
"insert and remove comments in visual and normal mode
vmap ,ic :s/^/#/g<CR>:let @/ = ""<CR>
map  ,ic :s/^/#/g<CR>:let @/ = ""<CR>
vmap ,rc :s/^#//g<CR>:let @/ = ""<CR>
map  ,rc :s/^#//g<CR>:let @/ = ""<CR>

set clipboard=unnamed " requires x11 support
set number relativenumber
set nobackup
set nowritebackup
set noswapfile
" sets p to paste formatted text
map <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>

"Splits windows naturally: to the right or below current window
set splitbelow
set splitright

"vim-spec-runner
let g:spec_runner_dispatcher = "VtrSendCommand! {command}"

"run all specs in current (f)ile
map <Leader>f <Plug>RunCurrentSpecFile 
"run specs at current (l)ine
map <leader>l <Plug>RunFocusedSpec
"(r)e-run last spec
map <leader>r <Plug>RunMostRecentSpec

" =====================   NERDTree   =====================
" Trigger configuration. Do not use <tab> if 
" you use https://github.com/Valloric/YouCompleteMe.


let g:UltiSnipsSnippetDirectories=[$HOME.'/dotfiles/UltiSnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

map <C-n> :NERDTreeToggle<CR>   
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let NERDTreeShowHidden=1

" =====================   Airline   =====================
set laststatus=2                                       " Make the second to last line of vim our status line
let g:airline_theme='lucius'                           " Use lucius theme
let g:airline#extensions#branch#enabled = 1            " Show the git branch in the status line
let g:airline#extensions#tabline#show_buffers = 0      " Do not list buffers in the status line
let g:airline#extensions#whitespace#enabled = 0        " Do not show trailing whitespace errors
let g:airline#extensions#ctrlp#show_adjacent_modes = 0 " Do not show mru, buffer, etc.

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.whitespace = 'Ξ'


" =====================   Color Scheme   =====================
colorscheme Tomorrow-Night-Eighties

 " ====== Colors for Indent Guides ====== "

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=23
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=236

 " ====== Search Highlight ====== "
 hi Search cterm=NONE ctermfg=grey ctermbg=blue

 " ===== Line Number Toggling ====== "
let g:NumberToggleTrigger="<F2>"

 "======  gundo =======
 nnoremap <F5> :GundoToggle<CR>
 
"======  ctrlp - performance  =======
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
if exists("g:ctrl_user_command")
  unlet g:ctrlp_user_command
endif
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/\.git/*
 "====== mustache-handlebars ======= "
" let g:mustache_abbreviations = 1

" ===== syntastic ===== "
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_quiet_messages = { "type": "style" }
" " let g:syntastic_ruby_checkers = ['rubocop', 'mri']

" nnoremap <Leader>sr :SyntasticReset<CR>
