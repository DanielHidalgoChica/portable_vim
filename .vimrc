set encoding=utf-8
runtime defaults.vim

silen! colo habamax
set aw nu rnu nowrap "Autowrite number relativenumber nowrap
set noet sr ts=8 sts=0 sw=0 "tabs
nnoremap <F7> :make CXXFLAGS="-std=c++11 -Wall -Wextra" %:r<CR>


inoremap jk <ESC>
set pt=<C-K> "paste toggle
