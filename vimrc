function! SourceFile(file)
  if filereadable(expand(a:file))
    exe 'source' a:file
  endif
endfunction

call SourceFile("~/.vim/settings.vim")
call SourceFile("~/.vim/plugins.vim")
call SourceFile("~/.vim/plugin_settings.vim")

if has('nvim')
 call SourceFile("~/.vim/nvim_settings.vim")
endif
source ~/dotfiles/vim/settings.vim
source ~/dotfiles/vim/plugins.vim
source ~/dotfiles/vim/plugin_settings.vim

