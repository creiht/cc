" Found somewhere on the internet and modified
syntax on
colorscheme darkocean

" Disable Generation of Backup Files
" ----------------------------------
"  actually they are nice but vim is stable and doesn't crash :D
set nobackup
set noswapfile

" Some File Type Stuff
" --------------------
"  Enable filetype plugins and indention
filetype on
filetype plugin on
filetype indent on

" Leader
" ------
" sets leader to ',' and localleader to "\"
let mapleader=","
let maplocalleader="\\"

" User Interface
" --------------
" activate wildmenu, permanent ruler and disable Toolbar, and add line
" highlightng as well as numbers.
" And disable the sucking pydoc preview window for the omni completion
" also highlight current line and disable the blinking cursor.
set wildmenu
set ruler
set guioptions-=T
"set cursorline
set completeopt-=preview
set gcr=a:blinkon0

" Set Better Indention
" --------------------
"  go with smartindent if there is no plugin indent file.
"  but don't outdent hashes
set smartindent
inoremap # #

" Statusbar and Linenumbers
" -------------------------
"  Make the command line two lines heigh and change the statusline display to
"  something that looks useful.
"set cmdheight=2
set laststatus=2
set statusline=[%l,%c\ %P%M]\ %f\ %r%h%w
"set number

" Tab Settings
" ------------
set smarttab
set tabstop=4

" utf-8 default encoding
" ----------------------
set enc=utf-8

" python support
" --------------
"  don't highlight exceptions and builtins. I love to override them in local
"  scopes and it sucks ass if it's highlighted then. And for exceptions I
"  don't really want to have different colors for my own exceptions ;-)
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
let python_highlight_all=1
let python_highlight_exceptions=0
let python_highlight_builtins=0

" template language support (SGML / XML too)
" ------------------------------------------
"  and disable taht stupid html rendering (like making stuff bold etc)

fun! s:SelectHTML()
  let n = 1
  while n < 50 && n < line("$")
    " check for jinja
    if getline(n) =~ '{%\s*\(extends\|block\|macro\|set\|if\|for\|include\|trans\)\>'
      set ft=htmljinja
      return
    endif
    " check for django
    if getline(n) =~ '{%\s*\(extends\|block\|comment\|ssi\|if\|for\|blocktrans\)\>'
      set ft=htmldjango
      return
    endif
    let n = n + 1
  endwhile
  " go with html
  set ft=html
endfun

autocmd FileType html,xhtml,xml,htmldjango,htmljinja,eruby,mako setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd BufNewFile,BufRead *.rhtml setlocal ft=eruby
autocmd BufNewFile,BufRead *.tmpl setlocal ft=htmljinja
autocmd BufNewFile,BufRead *.py_tmpl setlocal ft=python
"autocmd BufNewFile,BufRead *.html,*.htm  call s:SelectHTML()
autocmd BufNewFile,BufRead *.html,*.htm setlocal ft=htmldjango
autocmd BufNewFile,BufRead *.mako setlocal ft=mako
let html_no_rendering=1

let g:closetag_default_xml=1
autocmd FileType html,htmldjango,htmljinja,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,htmljinja,eruby,mako source ~/.vim/scripts/closetag.vim


" CSS
" ---
autocmd FileType css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

" rst
" ---
autocmd BufNewFile,BufRead *.txt setlocal ft=rst
autocmd FileType rst setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

" Javascript
" ----------
autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
let javascript_enable_domhtmlcss=1

" File Browser
" ------------
" hide some files and remove stupid help
"let g:explHideFiles='^\.,.*\.sw[po]$,.*\.pyc$'
"let g:explDetailedHelp=0
"map  :Explore!<CR>

" Better Search
" -------------
set hlsearch
set incsearch

" Minibuffer
" ----------
"  one click is enough and fix some funny bugs
"let g:miniBufExplUseSingleClick = 1
"let g:miniBufExplForceSyntaxEnable = 1
"let g:miniBufExplMapCTabSwitchBufs = 1

" BufClose
" --------
"  map :BufClose to :bq and ^B and configure it to open a file browser on close
"let g:BufClose_AltBuffer = '.'
"cnoreabbr <expr> bq 'BufClose' 
"map  :BufClose<CR>

