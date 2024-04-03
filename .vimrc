set encoding=utf-8
set number "Que salgan los números en las líneas
set rnu "Relative numbering
set nocompatible "Evita la compatibilidad con Vi y te quita de problemas
set hidden "Ni idea
set hlsearch "Para que highlightee los resultados de las búsquedas

"Case insensitive al menos que haya alguna con mayúsucla
set ignorecase
set smartcase

"Mapeo de jk a la tecla Esc en modo insertar 
inoremap jk <ESC>

syntax on "Sintaxis de colores en función del tipo

"Tamaño en espacios del caracter de tab
set tabstop=8 
set softtabstop=4
set shiftwidth=4
set noexpandtab
"Reemplazar tab's por espacios siempre

"Autoindentado, mantiene la indentación de la línea anterior
set autoindent
set smartindent
set cindent

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

map <leader>p :call TogglePaste()<cr>
"Fin paste toggle

""Configuraciones recomendadas para el CoC
"set nobackup
"set nowritebackup
"set updatetime=300
"" Use tab for trigger completion with characters ahead and navigate
"" NOTE: There's always complete item selected by default, you may want to enable
"" no select by `"suggest.noselect": true` in your configuration file
"" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
"" other plugin before putting this into your config
""inoremap <silent><expr> <TAB>
""      \ coc#pum#visible() ? coc#pum#next(1) :
""      \ CheckBackspace() ? "\<Tab>" :
""      \ coc#refresh()
""inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
"
"" Make <CR> to accept selected completion item or notify coc.nvim to format
"" <C-g>u breaks current undo, please make your own choice
"inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
"                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"
"function! CheckBackspace() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction
"
"" Use <c-space> to trigger completion
"if has('nvim')
"      inoremap <silent><expr> <c-space> coc#refresh()
"  else
"        inoremap <silent><expr> <c-@> coc#refresh()
"    endif
"
"    " Use `[g` and `]g` to navigate diagnostics
"    " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
"    nmap <silent> [g <Plug>(coc-diagnostic-prev)
"    nmap <silent> ]g <Plug>(coc-diagnostic-next)
"
"    " GoTo code navigation
"    nmap <silent> gd <Plug>(coc-definition)
"    nmap <silent> gy <Plug>(coc-type-definition)
"    nmap <silent> gi <Plug>(coc-implementation)
"    nmap <silent> gr <Plug>(coc-references)
"
"    " Use K to show documentation in preview window
"nnoremap <silent> K :call ShowDocumentation()<CR>
"
"function! ShowDocumentation()
"  if CocAction('hasProvider', 'hover')
"    call CocActionAsync('doHover')
"  else
"    call feedkeys('K', 'in')
"  endif
"endfunction
"
"" Highlight the symbol and its references when holding the cursor
"autocmd CursorHold * silent call CocActionAsync('highlight')
"
"" Symbol renaming
"nmap <leader>rn <Plug>(coc-rename)
"
"" Formatting selected code
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)
"
"augroup mygroup
"  autocmd!
"  " Setup formatexpr specified filetype(s)
"  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"  " Update signature help on jump placeholder
"  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"augroup end
"
"" Applying code actions to the selected code block
"" Example: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)
"
"" Remap keys for applying code actions at the cursor position
"nmap <leader>ac  <Plug>(coc-codeaction-cursor)
"" Remap keys for apply code actions affect whole buffer
"nmap <leader>as  <Plug>(coc-codeaction-source)
"" Apply the most preferred quickfix action to fix diagnostic on the current line
"nmap <leader>qf  <Plug>(coc-fix-current)
"
"" Remap keys for applying refactor code actions
"nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
"xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
"nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
"
"" Run the Code Lens action on the current line
"nmap <leader>cl  <Plug>(coc-codelens-action)
"
"" Map function and class text objects
"" NOTE: Requires 'textDocument.documentSymbol' support from the language server
"xmap if <Plug>(coc-funcobj-i)
"omap if <Plug>(coc-funcobj-i)
"xmap af <Plug>(coc-funcobj-a)
"omap af <Plug>(coc-funcobj-a)
"xmap ic <Plug>(coc-classobj-i)
"omap ic <Plug>(coc-classobj-i)
"xmap ac <Plug>(coc-classobj-a)
"omap ac <Plug>(coc-classobj-a)
"
"" Remap <C-f> and <C-b> to scroll float windows/popups
"if has('nvim-0.4.0') || has('patch-8.2.0750')
"  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
"  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
"  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"endif
"
"" Use CTRL-S for selections ranges
"" Requires 'textDocument/selectionRange' support of language server
"nmap <silent> <C-s> <Plug>(coc-range-select)
"xmap <silent> <C-s> <Plug>(coc-range-select)
"
"" Add `:Format` command to format current buffer
"command! -nargs=0 Format :call CocActionAsync('format')
"
"" Add `:Fold` command to fold current buffer
"command! -nargs=? Fold :call     CocAction('fold', <f-args>)
"
"" Add `:OR` command for organize imports of the current buffer
"command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')
"
"" Add (Neo)Vim's native statusline support
"" NOTE: Please see `:h coc-status` for integrations with external plugins that
"" provide custom statusline: lightline.vim, vim-airline
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"
"" Mappings for CoCList
"" Show all diagnostics
"nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions
"nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
"" Show commands
"nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
"" Find symbol of current document
"nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols
"nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item
"nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item
"nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list
"nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
""----------------------------
""FIN CONFIG CoC
""----------------------------

"Cuando insertas un paréntesis o similar, saltar
"al matcheado durante medio segundo
set showmatch
"
"Mostrar el comando que se está insertando abajo a la izquierda
"en la pantalla
set showcmd

"Highlightear la línea en la que estoy solo si estoy en modo 
"insertar
:autocmd InsertEnter * set cursorline
:autocmd InsertLeave * set nocursorline "Cursor

"Pa los plugins |
"		            v

filetype plugin on "Pa que reconozcan tipo los plugins
filetype plugin indent on "Para los plugins de formateo c++

call plug#begin()
"Plug 'lervag/vimtex' "Latex
"let g:tex_flavor='latex'
"let g:vimtex_view_method='zathura'
"let g:vimtex_quickfix_mode=0
"set conceallevel=1
"let g:tex_conceal='abdmg'
"
"Plug 'sirver/ultisnips' "Snippets 
"let g:UltiSnipsExpandTrigger = '<tab>'
"let g:UltiSnipsJumpForwardTrigger = '<tab>'
"let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
"let g:vimtex_compiler_latexmk = {
"    \ 'aux_dir' : '',
"    \ 'out_dir' : '',
"    \ 'callback' : 1,
"    \ 'continuous' : 1,
"    \ 'executable' : 'latexmk',
"    \ 'hooks' : [],
"    \ 'options' : [
"    \   '-verbose',
"    \   '-file-line-error',
"    \   '-synctex=1',
"    \   '-interaction=nonstopmode',
"    \ ],
"    \}
Plug 'https://github.com/vim-ruby/vim-ruby' "Ruby
Plug 'jiangmiao/auto-pairs' "Autopairs, te completa los parentesis
Plug 'gruvbox-community/gruvbox' "Colores
Plug 'vim-airline/vim-airline' "Colores
Plug 'vim-airline/vim-airline-themes' "Colores
Plug 'preservim/nerdtree' "Nerdtree pa buscar archivos con Ctrl-B
Plug 'vim-syntastic/syntastic' "Sintaxis de muchas cosas
Plug 'junegunn/vim-peekaboo' "Lo de las macros
"Plug 'neoclide/coc.nvim',{'branch':'release'}
call plug#end()

set termguicolors
colo gruvbox

"NerdTree Ctrl-B
inoremap <c-b> <Esc>:NERDTreeToggle<cr>
nnoremap <c-b> <Esc>:NERDTreeToggle<cr>
"Para quitar de enmedio el highlighting después de una búsqueda

" Use <C-K> to clear the highlighting of :set hlsearch.
if maparg('<C-K>', 'n') ==# ''
  nnoremap <silent> <C-K> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-K>
endif




"Pa que no me toquen la polla los comentarios automaticos
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"" Para compilación en latex
"if empty(v:servername) && exists('*remote_startserver')
"      call remote_startserver('VIM')
"endif


