source $VIMRUNTIME/defaults.vim

" Enable automatic indentation with 4 columns per indent level
set autoindent shiftwidth=4

" Read the file again if it was modified outside of Vim
set autoread

" ./.vim_backup - make backups in .vim_backup/ relative to the edited file
" ~/.vim_backup - make backups in .vim_backup/ of the home directory
" /tmp          - make backups in /tmp/
set backup backupdir=./.vim_backup,~/.vim_backup,/tmp

" Make Vim use the system clipboard
set clipboard=unnamedplus

" Set the color column to +1 of text width
set colorcolumn=+1 textwidth=80

" Show extra characters
" ⇥· (U+21E5) for tabs
" █  (U+2588) for trailing spaces
" ·  (U+00B7) for leading spaces
set list listchars=tab:\\u21e5\\u00b7,trail:\\u2588,lead:\\u00b7

" Enable mouse support
set mouse=a

" Use tabs by default with softtabstop in case of using spaces
set noexpandtab softtabstop=4 tabstop=4

" ./.vim_undo - make undo files in .vim_undo/ relative to the edited file
" ~/.vim_undo - make undo files in .vim_undo/ of the home directory
" /tmp        - make undo files in /tmp/
set undofile undodir=./.vim_undo,~/.vim_undo,/tmp
set undolevels=100 undoreload=1000

" Enable line numbers and make them relative
set number relativenumber
