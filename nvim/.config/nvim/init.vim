call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'fatih/vim-go'
Plug 'fatih/vim-hclfmt'
Plug 'nsf/gocode'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go'
Plug 'vim-scripts/LaTeX-Suite-aka-Vim-LaTeX'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar'
Plug 'lifepillar/vim-solarized8'

call plug#end()

syntax enable
colorscheme solarized8_dark

" vim-go
set autowrite
map <C-n> :cc<CR>
nnoremap <leader>a :cclose<CR>
autocmd BufWritePost *.go call go#cmd#Build(1)
let g:go_auto_sameids = 1
let g:go_fmt_command = "goimports"


let g:airline_theme='solarized'
nmap <F8> :TagbarToggle<CR>

" solarized
nnoremap  <leader>B :<c-u>exe "colors" (g:colors_name =~# "dark"
    \ ? substitute(g:colors_name, 'dark', 'light', '')
    \ : substitute(g:colors_name, 'light', 'dark', '')
    \ )<CR><CR>

fun! Solarized8Contrast(delta)
  let l:schemes = map(['_low', '_flat', '', '_high'], '"solarized8_".(&background).v:val')
  exe 'colors' l:schemes[((a:delta+index(l:schemes, g:colors_name)) % 4 + 4) % 4]
endf

nmap <leader>- :<c-u>call Solarized8Contrast(-v:count1)<cr>
nmap <leader>+ :<c-u>call Solarized8Contrast(+v:count1)<cr>

" vim latex
let g:tex_flavor = "latex"
let g:Tex_ViewRule_pdf = 'zathura'
let g:Tex_CompileRule_pdf = 'pdflatex -interaction=nonstopmode $*'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_MultipleCompileFormats='dvi,pdf'
let g:Tex_CompileRule_pdf = 'pdflatex -shell-escape -interaction=nonstopmode $*'

" deoplete-go
call deoplete#custom#set('go', 'matchers', ['matcher_full_fuzzy'])
call deoplete#custom#set('go', 'sorters', [])
call deoplete#custom#set('go', 'disabled_syntaxes', ['Comment'])
let g:deoplete#sources#go#package_dot = 1
let g:deoplete#sources#go#sort_class = ['func', 'type', 'var', 'const', 'package']
let g:deoplete#sources#go#pointer = 1
let g:deoplete#sources#go#use_cache = 1
let g:deoplete#sources#go#json_directory = $XDG_CACHE_HOME . '/deoplete/go/darwin_amd64'
let g:deoplete#sources#go#gocode_binary = $GOPATH . '/bin/gocode'
let g:deoplete#sources#go#cgo = 1
let g:deoplete#sources#go#cgo#libclang_path = '/opt/llvm/lib/libclang.dylib'
let g:deoplete#sources#go#on_event = 1

map <F7> :NERDTreeToggle<CR>

set termguicolors


