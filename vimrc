call plug#begin('~/.vim/plugged')

Plug 'rking/ag.vim'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'rust-lang/rust.vim'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'Valloric/YouCompleteMe'
Plug 'rhysd/vim-clang-format'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-scripts/indentpython.vim'
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'

call plug#end()

" Fat fingers
cabbrev Q quit
cabbrev W write
cabbrev Wq wq

" Hit return to clear search highlight. Thanks, Zdenek Sekera!
nnoremap <silent> <CR> :nohlsearch<CR>
nnoremap <F5> :GundoToggle<CR>
nnoremap <C-n> :NERDTree<CR>
vnorem // y/<c-r>"<cr>

set encoding=utf-8

" Soft wrap
set linebreak
map <down> gj
map <up> gk
imap <down> <C-O>gj
imap <up> <C-O>gk
set smartindent
set nolist                        " breaks soft wrap :(

colo molokai

" Rest based on http://git.wincent.com/wincent.git/blob_plain/HEAD:/.vimrc
set nocompatible                  " just in case system-wide vimrc has set this otherwise
set hlsearch                      " highlight search strings
set incsearch                     " incremental search ("find as you type")
set ignorecase                    " ignore case when searching
set smartcase                     " except when search string includes a capital letter
set number                        " show line numbers in gutter
set laststatus=2                  " always show status line
set ww=h,l,<,>,[,]                " allow h/l/left/right to cross line boundaries
set autoread                      " if not changed in Vim, automatically pick up changes after "git co" etc
set guioptions-=T                 " don't show toolbar
set hidden                        " allows you to hide buffers with unsaved changes without being prompted
set wildmenu                      " show options as list when switching buffers etc
set wildmode=longest:full,full    " shell-like autocomplete to unambiguous portion
set history=1000                  " longer search and command history (default is 20)
set scrolloff=3                   " start scrolling 3 lines before edge of viewport
set backupdir=~/.vim/tmp/backup,. " keep backup files out of the way
set directory=~/.vim/tmp/swap,.   " keep swap files out of the way
set ttimeoutlen=50                " speed up O etc in the Terminal
set virtualedit=block             " allow cursor to move where there is no text in visual block mode
set showmatch                     " show matching brackets
" set showcmd                       " extra info in command line
set nojoinspaces                  " don't autoinsert two spaces after '.', '?', '!' for join command
set wildignore+=*.o               " don't offer to autocomplete object files
set cc=120

" statusline
" cf the default statusline: %<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
" format markers:
"   %< truncation point
"   %n buffer number
"   %f relative path to file
"   %m modified flag [+] (modified), [-] (unmodifiable) or nothing
"   %r readonly flag [RO]
"   %y filetype [ruby]
"   %= split point for left and right justification
"   %-35. width specification
"   %l current line number
"   %L number of lines in buffer
"   %c current column number
"   %V current virtual column number (-n), if different from %c
"   %P percentage through buffer
"   %) end of width specification
set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)

" Configure airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" all languages
set shiftwidth=2                  " spaces per tab (when shifting)
set tabstop=2                     " spaces per tab
set expandtab                     " always use spaces instead of tabs
set smarttab                      " <tab> key
set autoindent
set backspace=indent,eol,start

" Python
autocmd FileType python set tabstop=4
autocmd FileType python set shiftwidth=4
autocmd FileType python set softtabstop=4
autocmd FileType python set textwidth=79

" C
autocmd FileType c set tabstop=2
autocmd FileType c set shiftwidth=2

" Cpp
autocmd FileType cpp set tabstop=2
autocmd FileType cpp set shiftwidth=2
set cindent
set cinoptions=g0

" Swift
autocmd FileType swift set tabstop=4
autocmd FileType swift set shiftwidth=4

" Rust
autocmd FileType rust set tabstop=4
autocmd FileType rust set shiftwidth=4

" automatic, language-dependent indentation, syntax coloring and other
" functionality
filetype plugin indent on
let python_highlight_all=1
syntax on

let mapleader="`"
let maplocalleader="\\"

" ,e -- edit file, starting in same directory as current file
map <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Fix some weird problem with $PATH mangling
set shell=/bin/bash

" Haskell specific
set nofoldenable    " disable folding
let g:haskell_conceal_enumerations=0

" Auto-pairs
let g:AutoPairsShortcutToggle = '<leader>p'
let g:AutoPairsShortcutFastWrap = '<leader>e'
let g:AutoPairShortcutJump = '<leader>n'

""EasyMotion
" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-s2)

" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Automatically hide NERDTree after file has been opened
let NERDTreeQuitOnOpen=1

" Disable right hand scroll bar
set guioptions-=r

" YCM
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

let g:clang_format#style_options = {
    \ "AccessModifierOffset" : -2,
    \ "AlignEscapedNewlinesLeft" : "true",
    \ "AlignTrailingComments" : "true",
    \ "AllowShortFunctionsOnASingleLine" : "true",
    \ "AllowShortIfStatementsOnASingleLine" : "true",
    \ "AllowShortCaseLabelsOnASingleLine" : "true",
    \ "AllowShortBlocksOnASingleLine" : "true",
    \ "AllowShortLoopsOnASingleLine" : "true",
    \ "Standard" : "C++11",
    \ "BreakBeforeBraces" : "Stroustrup",
    \ "ColumnLimit" : 80,
    \ "ConstructorInitializerAllOnOneLineOrOnePerLine" : "true",
    \ "IndentPPDirectives" : "AfterHash",
    \ "IndentWidth" : 2}

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>

" map to <Leader>cf in Rust code
autocmd FileType rust nnoremap <buffer><Leader>cf :<C-u>RustFmt<CR>
autocmd FileType rust vnoremap <buffer><Leader>cf :RustFmt<CR>

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

nmap <Leader>ln :lnext<CR>
nmap <Leader>lf :lfirst<CR>
nmap <Leader>lp :lprev<CR>
nmap <Leader>lc :lclose<CR>
