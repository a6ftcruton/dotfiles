" Allow the same window movements from terminal mode
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-l> <C-\><C-n><C-w>l
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-j> <C-\><C-n><C-w>j

" Terminal Mode
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

