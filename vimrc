call plug#begin('~/.vim/plugged')

" Searching
Plug 'rking/ag.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'

" Vim Looks & Layout
Plug 'flazz/vim-colorschemes'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'zhaocai/GoldenView.Vim'

" Github
Plug 'tpope/vim-fugitive', { 'tag': 'v2.3'}

" Text completion, editing, linting, syntax hightlighting
Plug 'tpope/vim-sensible'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'exvim/ex-indenthtml.vim'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/auto-pairs-gentle'
Plug 'w0rp/ale'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'nathanaelkane/vim-indent-guides'       ",ig
Plug 'tpope/vim-commentary'                  "gcc
Plug 'editorconfig/editorconfig-vim'

Plug 'sheerun/vim-polyglot'
Plug 'HerringtonDarkholme/yats.vim'

call plug#end()

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

" Allow the same window movements from terminal mode
if has('nvim')
  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-l> <C-\><C-n><C-w>l
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-j> <C-\><C-n><C-w>j
endif

" Resize splits Split
nnoremap <silent> <Leader>+ :exe 'resize ' . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe 'resize ' . (winheight(0) * 2/3)<CR>

" Terminal Mode
if has('nvim')
  " Ctrl+f - opens a terminal buffer below
  nnoremap <C-f>- :split \| terminal<CR>
  nnoremap <C-f>_ :vsplit \| terminal<CR>

  " Terminal Mode
  augroup neovim_terminal
    autocmd!

    tnoremap <Esc> <C-\><C-n>

    " Enter Terminal-mode (insert) automatically
    autocmd TermOpen * startinsert

    " Disables number lines on terminal buffers
    autocmd TermOpen * :set nonumber norelativenumber
  augroup END
endif

" =====================   CtrlP   =====================
let g:ctrlp_buffer_func = {
    \ 'enter': 'HideStatusBar',
    \ 'exit':  'UnideStatusBar',
    \ }

func! HideStatusBar()
    set laststatus=0
endfunc

func! UnideStatusBar()
    set laststatus=2
endfunc

  "======  CtrlP - performance  =======
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_max_height=35
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g "" --ignore-dir node_modules'
endif
if exists("g:ctrl_user_command")
  unlet g:ctrlp_user_command
endif
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/\.git/*


" =====================   GoldenView   =====================
let g:goldenview__enable_default_mapping = 0           " gimme back ctrlp
nmap <silent> <C-f>=   <Plug>GoldenViewSwitchMain
nmap <silent> <C-f>\ <Plug>GoldenViewSwitchToggle

" =====================   UltiSnips   =====================
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/dotfiles/UltiSnips']
let g:UltiSnipsSnippetsDir="~/dotfiles/UltiSnips"

" =====================   NERDTree   =====================
map <C-n> :NERDTreeToggle<CR>
nmap <silent> <C-f>f :NERDTreeFind<CR>

let g:NERDTreeNodeDelimiter = "\u00a0"
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1

" Open a NerdTree if no file is given as CLI argument
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close if the only remaining window is a nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

autocmd BufReadPre,FileReadPre * :NERDTreeClose

" =====================   Airline   =====================
" let g:ctrlp_map = '<C-p>'
" let g:ctrl_cmd = 'CtrlP'

" =====================   Airline   =====================
let g:airline_theme='angr'
let g:airline_extensions = ['branch']
let g:airline#extensions#whitespace#enabled = 0              " Do not show trailing whitespace errors
let g:airline#extensions#ctrlp#show_adjacent_modes = 0       " Do not show mru, buffer, etc.
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]' " remove annoying uft-8 from status line
let g:airline#extensions#wordcount#enabled = 0               " who cares how many words you have

" See airline-default-sections
let g:airline_section_b = airline#section#create(['branch'])
let g:airline_section_c = '%f'
let g:airline_section_x = []
let g:airline_section_z = airline#section#create(['linenr', ':%c ']) "line and col number

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.dirty='⚡'


" =====================   Color Scheme   =====================
colorscheme Tomorrow-Night-Eighties

" ====== Colors for Indent Guides ====== "
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=23
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=236

" ====== Search Highlight ====== "
hi Search cterm=NONE ctermfg=grey ctermbg=blue

"  Draw attention to trailing whitespace
exec "set listchars=trail:\UB7"
set list

" ===== Line Number Toggling ====== "
let g:NumberToggleTrigger="<F2>"

"======  JSX  =======
let g:vim_jsx_pretty_colorful_config = 1

"======  Ale  =======
let g:airline#extensions#ale#enabled = 1
let g:ale_fix_on_save = 1
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '-'

highlight ALEWarning ctermbg=DarkMagenta 
highlight ALEError ctermbg=DarkMagenta
highlight ALEError ctermbg=none cterm=underline 
highlight ALEWarning ctermbg=none cterm=underline

" let g:ale_linter_aliases = {'jsx': ['javascript'], 'tsx':['typescript']}
" let g:ale_linters = {'jsx': ['eslint'], 'tsx': ['eslint']}
let g:ale_linter_aliases = {'jsx': ['javascript']}
let g:ale_linters = {'jsx': ['eslint']}
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_pattern_options = {
\   '.*cypress/integration/.*\.js$': {'ale_enabled': 0},
\   '.*cypress/integration/*/.*\.js$': {'ale_enabled': 0},
\   '.*\.spec.js$': {'ale_enabled': 0},
\}

" ------- Emmet --------
let g:user_emmet_leader_key='<C-E>'

" prevent :autocmd, shell and write commands from being run inside project-specific .vimrc files unless they’re owned by you.
" https://andrew.stwrt.ca/posts/project-specific-vimrc/
set secure
