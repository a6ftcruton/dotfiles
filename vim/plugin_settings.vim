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
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
endif
" if exists("g:ctrl_user_command")
"   unlet g:ctrlp_user_command
" endif
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/\.git/*


" =====================   GoldenView   =====================
let g:goldenview__enable_default_mapping = 0           " gimme back ctrlp
nmap <silent> <C-f>=   <Plug>GoldenViewSwitchMain
nmap <silent> <C-f>\ <Plug>GoldenViewSwitchToggle

" =====================   UltiSnips   =====================
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/dotfiles/UltiSnips', 'UltiSnips']
let g:UltiSnipsSnippetsDir="~/dotfiles/UltiSnips"


" =====================   NERDTree   =====================
map <C-n> :NERDTreeToggle<CR>
nmap <silent> <C-f>f :NERDTreeFind<CR>

let g:NERDTreeNodeDelimiter = "\u00a0"
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1

" Open a NerdTree if no file is given as CLI argument
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close if the only remaining window is a nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

autocmd BufReadPre,FileReadPre * :NERDTreeClose

" =====================   Airline   =====================
let g:airline_theme='angr'
let g:airline_extensions = ['branch']
let g:airline#extensions#whitespace#enabled = 0 " Do not show trailing whitespace errors
let g:airline#extensions#ctrlp#show_adjacent_modes = 0 " Do not show mru, buffer, etc.
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]' " remove annoying uft-8 from status line
let g:airline#extensions#wordcount#enabled = 0 " who cares how many words you have

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

" ====== Minimal Goodness Together (Goyo + Limelight) ====== "
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" ====== Search Highlight ====== "
hi Search cterm=NONE ctermfg=grey ctermbg=blue

"  Draw attention to trailing whitespace
exec "set listchars=trail:\UB7"
set list

" ===== Line Number Toggling ====== "
let g:NumberToggleTrigger="<F2>"

"======  JSX  =======
let g:vim_jsx_pretty_colorful_config = 1

"======  CoC  =======
let g:coc_global_extensions = [
      \ 'coc-css',
      \ 'coc-eslint',
      \ 'coc-html',
      \ 'coc-json',
      \ 'coc-python',
      \ 'coc-tsserver',
      \ 'coc-prettier',
      \ 'coc-yaml'
\ ]
set cmdheight=2
set updatetime=300
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" ------- Emmet --------
let g:user_emmet_leader_key='<C-E>'

