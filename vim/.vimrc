" Basic config

set encoding=utf8
set number
set incsearch
set cursorline
set wildmenu
set ruler
set hid
set showcmd
if has('mouse')
  set mouse=a
endif
set hlsearch
set incsearch
set magic
set showmatch
set noerrorbells
set novisualbell
set foldcolumn=0
set nobackup
set nowb
set noswapfile
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set ai
set si
set lazyredraw
set backspace=indent,eol,start
let mapleader=","
" easy turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Setup folding
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent
nnoremap <space> za

" Map window movement
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Pathogen setup
execute pathogen#infect()
syntax on
filetype plugin indent on

" Colorscheme setup
colorscheme molokai

" Neocomplete setup
let g:neocomplete#enable_at_startup=1
let g:neocomplete#enable_smart_case=1
let g:neocomplete#sources#syntax#min_keyword_length=3

" Ctrlp setup
"
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
  \}

" Go tagbar setup
let g:tagbar_type_go = {  
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
nmap <F8> :TagbarToggle<CR>

" Syntastic setup
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0

" Airline setup
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" Vim-go setup
let g:go_highlight_functions=1
let g:go_highlight_methods=1
let g:go_highlight_structs=1
let g:go_highlight_operators=1
let g:go_fmt_command = "goimports"

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <leader>d <Plug>(go-doc-browser)
au FileType go nmap <leader>i <Plug>(go-info)
au FileType go nmap <leader>e <Plug>(go-rename)

" Python-mode setup
let g:pymode_lint=1
let g:pymode_lint_checker="pep8"
let g:pymode_lint_write=1
let g:pymode_syntax=1
let g:pymode_syntax_all = 1
let g:pymode_folding = 0
