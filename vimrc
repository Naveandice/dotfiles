source $VIMRUNTIME/defaults.vim

set autoindent shiftwidth=4
set expandtab softtabstop=4 tabstop=4
set colorcolumn=+1 textwidth=80
set number relativenumber

" ⇥· (\u21e5 and \u00b7) for tabs
" █  (\u2588) for trailing spaces
" ·  (\u00b7) for leading spaces
set list listchars=tab:\\u21e5\\u00b7,trail:\\u2588,lead:\\u00b7

set backup backupdir=./.vim_backup,~/.vim/backup,/tmp
set undofile undodir=./.vim_undo,~/.vim/undo,/tmp
set undolevels=100 undoreload=1000

set autoread
set clipboard=unnamedplus
set mouse=a
set viminfo+=n~/.vim/viminfo
