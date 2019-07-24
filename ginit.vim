" init.vim
"
" Author: Leonardo Mariscal
" Source: https://ldmd.mx/gvim
" Description: My vimrc for the gui, so ginit.vim. Grab whatever you want!
" Website: https://www.ldmd.mx/

:GuiPopupmenu 0

augroup auguicommands
  au BufEnter * :call GuiWindowFullScreen(1)
augroup END

let hostname = substitute(system('hostname'), '\n', '', '')

if hostname == "Tabula"
  :Guifont Hack:h9
elseif hostname == "Ulbert"
  :Guifont Hack:h10
endif
