" ==============================================================================
" PLUGIN MANAGEMENT (via vim-plug)
" ==============================================================================
call plug#begin('~/.vim/plugged')

" Theme: Gruvbox
Plug 'morhetz/gruvbox'

" Autocompletion & LSP: Conquer of Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" ==============================================================================
" CORE SETTINGS
" ==============================================================================
syntax on
set number              " Show absolute line numbers
set tabstop=4           " 4 spaces per tab (Standard for Python/C)
set shiftwidth=4        " Indentation width
set expandtab           " Convert tabs to spaces
set smartindent         " Auto-indent new lines
set updatetime=300      " Faster completion rendering

" ==============================================================================
" THEME CONFIGURATION
" ==============================================================================
set background=dark     " Gruvbox night mode
colorscheme gruvbox

" ==============================================================================
" COC.NVIM CONFIGURATION (Autocompletion)
" ==============================================================================
" Automatically install C and Python language servers on first run
let g:coc_global_extensions = ['coc-clangd', 'coc-basedpyright']

" Use <Tab> and <S-Tab> to navigate the completion menu
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Use <CR> (Enter) to confirm completion
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Helper function for the Tab mapping
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
