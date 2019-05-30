set nocompatible              " be iMproved, required
filetype off                  " required
"set encoding=
""""""""""""""""""""""""""""""Start myConf
filetype plugin on
syntax on

"filetype plugin indent on
"" show existing tab with 4 spaces width
"set tabstop=4
"" when indenting with '>', use 4 spaces width
"set shiftwidth=4
"" On pressing tab, insert 4 spaces
"set expandtab



set encoding=utf-8
set nowrap
set number
"no bells
set noeb vb t_vb=
set ruler
"  BackSpece issue
set backspace=2
set backspace=indent,eol,start
" Set tabs to 
"set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
:set ts=4 sw=4

:set cursorline 
:set foldmethod=syntax 
:map <F12> :w<CR>
:set ignorecase
:set guioptions+=b
:set guioptions-=T

"set guioptions+=lrbmTLce
"set guioptions-=lrbmTLce
"set guioptions+=c
"""""""""""""""""""""""""""""""End of myConf
" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'<F12>
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'


Plug 'vim-airline/vim-airline'



" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'

Plug 'sjl/badwolf'

Plug 'jpalardy/vim-slime'

Plug 'kkoenig/wimproved.vim'

Plug 'tpope/vim-fugitive'

" Initialize plugin system
call plug#end()




filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set laststatus=2

if has('gui_running')
  set guifont=Consolas:h10
endif

" to do folds with space bar
"unmap <Plug>NERDComComment
"nnoremap <Space> <plug>NERDComComment
vmap <Space> <Leader>c<Space>

map <C-n> :NERDTreeToggle<CR>

nnoremap <Space> za
"Mapping comment
"unmap
vnoremap <F2> <plug>NERDComComment



":map <2-LeftMouse> *
nnoremap <silent> <2-LeftMouse> :let @/='\V\<'.escape(expand('<cword>'), '\').'\>'<cr>:set hls<cr>

"let g:ackprg = 'ag --nogroup --nocolor --column'


"function! NeatFoldText()
    "let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
    "let lines_count = v:foldend - v:foldstart + 1
    "let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
    "let foldchar = matchstr(&fillchars, 'fold:\zs.')
    "let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
    "let foldtextend = lines_count_text . repeat(foldchar, 8)
    "let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
    "return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
"endfunction

"set foldtext=NeatFoldText()

function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()

nnoremap gf :vertical wincmd f<CR>
let g:ack_apply_qmappings = 1

map ñ :
"map z e
nmap e :

set foldlevel=99
:set enc=utf-8

au GUIEnter * simalt ~x


let wiki = {}
let g:vimwikidir = $HOME . "/OneDrive/VimNotes/notes" 
let wiki.path = g:vimwikidir
let g:vimwiki_list=[wiki]

" vimwiki 
let wiki_1 = {}
let wiki_1.path = $HOME . "/OneDrive/VimNotes/notes" 
"let wiki_1.path_html = '~/vimwiki_html/'

let wiki_2 = {}
let wiki_2.path = $HOME . "/OneDrive/VimNotes/notes_work" 
"let wiki_2.path_html = '~/private_html/'

let g:vimwiki_list = [wiki_1, wiki_2]


:let mapleader=","

":set autoread
:setl autoread
colorscheme badwolf

  	
cnoremap <expr> %%  getcmdtype() == ':' ? expand('%:h').'/' : '%%'

"let g:auto_save = 1 


"set shell=c:\cygwin64\bin\bash.exe


" <F11> moves to "previous" change location,
" <F12> moves to "next" change location,
map <F8> [c
map <F9> ]c

" SHIFT<F12> does a "diff put" change location,
map <S-F12> do



set langmenu=en_US
let $LANG = 'en_US'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim


"autocmd GUIEnter * silent! WToggleClean
"
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

 " Use fuzzy completion relative filepaths across directory
  imap <expr> <c-x><c-f> fzf#vim#complete#path('git ls-files $(git rev-parse --show-toplevel)')


" from https://realpython.com/vim-and-python-a-match-made-in-heaven/ 
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
     
nnoremap <buffer> <F1> :exec '!python' shellescape(@%, 1)<cr>

let g:jedi#force_py_version = 2
let g:UltisnipsUsePythonVersion = 2
let g:conda_startup_msg_suppress = 1
let g:conda_startup_msg_suppress = 0


let g:slime_target = "vimterminal"

:tnoremap <Esc> <C-\><C-n>


 set guioptions-=T       " remove toolbar
    set guioptions+=L       " left scroll bar
set guioptions+=r       " right scroll bar

"from "https://aonemd.github.io/blog/handy-keymaps-in-vim
"autoclose tags
inoremap ( ()<Left>
inoremap { {}<Left>
inoremap [ []<Left>
inoremap " ""<Left>

""
"The Leader
let mapleader="\<Space>"

nnoremap <leader>* :%s/\<<c-r><c-w>\>//g<left><left>


"move lines around
nnoremap <leader>j :m+<cr>==
nnoremap <leader>k :m-2<cr>==
xnoremap <leader>k :m-2<cr>gv=gv
xnoremap <leader>j :m'>+<cr>gv=gv

"Tab to switch to next open buffer
nnoremap <Tab> :bNext<cr>



"move to the split in the direction shown, or create a new split
nnoremap <silent> <C-h> :call WinMove('h')<cr>
nnoremap <silent> <C-j> :call WinMove('j')<cr>
nnoremap <silent> <C-k> :call WinMove('k')<cr>
nnoremap <silent> <C-l> :call WinMove('l')<cr>

function! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr())
    if (match(a:key,'[jk]'))
      wincmd v
    else
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction

"this another test"
