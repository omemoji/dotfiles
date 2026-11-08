set number
set cursorline
set tabstop=4
set expandtab
set hls
set smartindent
set fenc=utf-8
set nobackup
set noswapfile
" Linux (X11/Wayland) では * が PRIMARY 選択なので、使えるなら + (クリップボード) を使う
if has('unnamedplus')
  set clipboard+=unnamedplus
else
  set clipboard+=unnamed
endif
set wildmenu

syntax enable

" show full file path  
set laststatus=2
set statusline+=%F
inoremap jj <Esc>





