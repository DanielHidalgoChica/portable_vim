set number "Que salgan los números en las líneas
set rnu
set nocompatible "Evita la compatibilidad con Vi y te quita de problemas
set hidden "Ni idea
set hlsearch "Para que highlightee los resultados de las búsquedas
set ignorecase
set smartcase
filetype plugin on "Ni idea
inoremap jk <ESC>
nnoremap <esc><esc> :noh<return><esc> 
syntax on "Sintaxis
filetype plugin indent on "Para los plugins de formateo c++
set ts=2 sts=2 sw=2 et ai si "Para tabulador estándar de 2 espacios	
set backspace=indent,eol,start " pa que el backspace funcione
set showcmd
:autocmd InsertEnter * set cursorline
:autocmd InsertLeave * set nocursorline "Cursor

"Pa los plugins |
"		            v

call plug#begin()
Plug 'https://github.com/vim-ruby/vim-ruby'
Plug 'jiangmiao/auto-pairs'
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'vim-syntastic/syntastic'
Plug 'junegunn/vim-peekaboo'
call plug#end()

" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

set termguicolors
colo gruvbox

"NerdTree Ctrl-B
inoremap <c-b> <Esc>:NERDTreeToggle<cr>
nnoremap <c-b> <Esc>:NERDTreeToggle<cr>
"Para quitar de enmedio el highlighting después de una búsqueda

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif




"Pa que no me toquen la polla los comentarios automaticos
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
