" Install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

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
Plug 'junegunn/goyo.vim' " distraction-free vim
Plug 'junegunn/limelight.vim' " with a hint of lime

" Github
Plug 'tpope/vim-fugitive', { 'tag': 'v2.3'}

" Text completion, editing, linting, syntax hightlighting
Plug 'tpope/vim-sensible'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'exvim/ex-indenthtml.vim'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nathanaelkane/vim-indent-guides'       ",ig
Plug 'tpope/vim-commentary'                  "gcc
Plug 'editorconfig/editorconfig-vim'

Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'jparise/vim-graphql'

Plug 'sheerun/vim-polyglot'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }

call plug#end()

