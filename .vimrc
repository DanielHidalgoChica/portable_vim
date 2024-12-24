set encoding=utf-8
set number "Que salgan los números en las líneas
set rnu "Relative numbering
set nocompatible "Evita la compatibilidad con Vi y te quita de problemas
set hidden "Para cambiar de buffer sin guardar
set hlsearch "Para que highlightee los resultados de las búsquedas

"Mapeo de jk a la tecla Esc en modo insertar
inoremap jk <ESC>
inoremap kj <ESC>


"Case insensitive al menos que haya alguna con mayúsucla
set ignorecase
set smartcase

"Permitir sintaxis
syntax on

" Tamaño en espacios del caracter de tab (opciones
" recomendadas en vim para tabstop, y
" softabstop=shiftwidth=num_espacios_por_tab)
set tabstop=8
set softtabstop=4
set shiftwidth=4
set noexpandtab
"Reemplazar tab's por espacios siempre

filetype on
filetype indent on "Para que reconozca el tipo
		   "de archivo y ajuste en función
		   "de eso
filetype plugin on

"Editorconfig para config de estilo especifica de proyectos
packadd! editorconfig

"Pal paste toggle
function! TogglePaste()
    if(&paste == 0)
        set paste
        echo "Paste Mode Enabled"
    else
        set nopaste
        echo "Paste Mode Disabled"
    endif
endfunction

"Poner como leaderkey la coma
let mapleader = ","
map <leader>p :call TogglePaste()<cr>
"Fin paste toggle

"Mostrar el comando que se está insertando abajo a la izquierda
"en la pantalla
set showcmd

call plug#begin()
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-peekaboo' "Lo de las macros
call plug#end()

"Colores, esquema en .vim/colors
set termguicolors
colorscheme true-monochrome



" Use <C-K> to clear the highlighting of :set hlsearch.
if maparg('<C-K>', 'n') ==# ''
  nnoremap <silent> <C-K> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-K>
endif

"Config de netrw
let g:netrw_liststyle= 3
