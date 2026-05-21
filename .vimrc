" --- PLUGINS ---
call plug#begin('~/.vim/plugged')

" Aesthetics & Themes
Plug 'morhetz/gruvbox'          " Masterpiece theme for day/night
Plug 'itchyny/lightline.vim'    " Sleek, lightweight status bar at the bottom

" Utility & Language Support
Plug 'dense-analysis/ale'       " Async linting (shows C/Python errors on the fly)
" The Autocomplete Engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" --- GENERAL SETTINGS ---
set nocompatible
filetype plugin indent on
syntax on
set number                    " Show line numbers
set relativenumber            " Great for quick jumping (optional)
set mouse=a                   " Enable mouse scrolling/clicks in GNOME terminal
set clipboard=unnamedplus     " Shares clipboard with GNOME desktop
set cursorline                " Highlight the line you are currently on

" --- TABS & INDENTATION ---
set tabstop=4
set shiftwidth=4
set expandtab                 " Converts tabs to spaces
set smartindent

" --- THEME & BEAUTIFICATION ---
set termguicolors             " Enables 24-bit RGB color in GNOME terminal
colorscheme gruvbox
set background=dark           " Default to dark mode for night coding

" Minimalist Lightline status bar config
let g:lightline = { 'colorscheme': 'gruvbox' }

" --- DAY / NIGHT TOGGLE ---
" Press F5 to flip between Dark mode (night) and Light mode (day)
nnoremap <F5> :let &background = ( &background == "dark" ? "light" : "dark" )<CR>

" --- LANGUAGE SPECIFIC TWEAKS ---
" Python: Standard PEP8 spacing
autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab

" C Language: Classic style
autocmd FileType c setlocal tabstop=4 shiftwidth=4 expandtab

" Assembly: ASM files usually look better with real tabs or wider spacing
autocmd FileType asm setlocal noexpandtab tabstop=8 shiftwidth=8

" --- COC AUTOCOMPLETE CONFIG ---

" Use tab for trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> (Enter) to accept selected completion item
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation (Hold 'g' then press 'd' to find where a function is defined)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in a preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" --- C COMPILATION SHORTCUTS ---

" Press F9 to just COMPILE the current C file
nnoremap <F9> :w <bar> !gcc -o %:r %<CR>

" Press F10 to COMPILE AND RUN the C file immediately
nnoremap <F10> :w <bar> !gcc -o %:r % && ./%:r<CR>
