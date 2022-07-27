call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go'
Plug 'preservim/nerdtree'
Plug 'vim-syntastic/syntastic'
Plug 'itspriddle/vim-shellcheck'
Plug 'hashivim/vim-terraform'
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

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:terraform_align = 1
let g:terraform_fmt_on_save = 1
let g:syntastic_go_checkers = ['govet', 'errcheck', 'go']
