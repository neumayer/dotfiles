call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go'
Plug 'preservim/nerdtree'
call plug#end()

let g:fakeclip_provide_clipboard_key_mappings = !empty($WAYLAND_DISPLAY)
let g:airline_theme='molokai'

set listchars=eol:¬,tab:▸\ 
set listchars+=trail:◦
set listchars+=lead:◦

:nmap <leader>l :set invlist<cr>

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
