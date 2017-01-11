" My Custom Setting
" Do Not $source .vimrc (on zsh)

set encoding=utf-8
scriptencoding utf-8

syntax on

imap <c-[> <esc>

set laststatus=2
" Top Line
"set showtabline=2

"set linespace=1
"set ambiwidth=single

set noundofile
set noswapfile
set nobackup

set cursorline
hi clear CursorLine

autocmd ColorScheme * highlight LineNr ctermfg=1
"let g:hybrid_use_iTerm_colors = 1
set background=dark
colorscheme hybrid
syntax on

"filetype plugin indent on
set t_Co=256

set smarttab
set expandtab
set virtualedit=block

set ignorecase
set smartcase
set incsearch
set nohlsearch
set wrapscan

set number

set clipboard=unnamed

set backspace=eol,indent,start

set wildmenu
set wildmode=list:full
set wildignore=*.o,*.obj,*.pyc,*.so,*.dll
let g:python_highlight_all = 1

" homeフォルダの.vimrcをスペースドットで開く
nnoremap <space>. :tabedit $MYVIMRC<CR>

" docstringは表示しない
autocmd FileType python setlocal completeopt-=preview

" Cursole Change on Tmux---------------
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" End tmux Setting----------------------

" Python Setting--------------------------
setlocal smarttab
setlocal expandtab
setlocal tabstop=4
setlocal shiftwidth=4
setlocal foldmethod=indent
setlocal commentstring=#%s

" - af: a function
" - if: inner function
" - ac: a class
" - ic: inner class

" this plugin has aditional key-bind
"  -  '[pf', ']pf': move to next/previous function
"  -  '[pc', ']pc': move to next/previous class
xmap <buffer> af <Plug>(textobj-python-function-a)
omap <buffer> af <Plug>(textobj-python-function-a)
xmap <buffer> if <Plug>(textobj-python-function-i)
omap <buffer> if <Plug>(textobj-python-function-i)
xmap <buffer> ac <Plug>(textobj-python-class-a)
omap <buffer> ac <Plug>(textobj-python-class-a)
xmap <buffer> ic <Plug>(textobj-python-class-i)
omap <buffer> ic <Plug>(textobj-python-class-i)

setlocal omnifunc=jedi#completions

" End Python Setting----------------------

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=~/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('~/.vim/dein'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')

call dein#add('davidhalter/jedi-vim')
let g:jedi#use_tabs_not_buffers = 1 "補完で次の候補に進むときにtabを使える設定のはずだが効かない(?)
let g:jedi#popup_select_first = 0 "1個目の候補が入力されるっていう設定を解除
let g:jedi#popup_on_dot = 0 " .を入力すると補完が始まるという設定を解除

call dein#add('hdima/python-syntax')
call dein#add('hynek/vim-python-pep8-indent')
call dein#add('andviro/flake8-vim')
call dein#add('sentientmachine/Pretty-Vim-Python')

call dein#add('Shougo/unite.vim')
call dein#add('thinca/vim-quickrun')
call dein#add('itchyny/lightline.vim')
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'component': {
      \   'readonly': '%{&readonly?"\u2b64":""}',
      \ },
      \ 'separator': { 'left': "\u2b80", 'right': "\u2b82" },
      \ 'subseparator': { 'left': "\u2b81", 'right': "\u2b83" },
      \ }

" You can specify revision/branch/tag.
call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------
