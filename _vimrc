" Download vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))   
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
			\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim   
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC 
endif
	
"Auto reload of vimrc
autocmd! bufwritepost .vimrc source %










"""""""""" Pluggins 
call plug#begin('~/.vim/plugged')

"vim-easy-align"
Plug 'junegunn/vim-easy-align'

" Vim-Snipmate for snippets
Plug 'garbas/vim-snipmate'| Plug 'tomtom/tlib_vim'| Plug 'MarcWeber/vim-addon-mw-utils' | Plug 'honza/vim-snippets'

"NerdTree
Plug 'scrooloose/nerdtree'

"Vim Surround
Plug 'tpope/vim-surround' 

"Git Gutter
Plug 'airblade/vim-gitgutter'

"Code commenting
Plug 'scrooloose/nerdcommenter'

"Colorscheme
Plug 'sjl/badwolf'

" Initialize plugin system
call plug#end()












""""NerdTree
nnoremap <silent> <F4> :NERDTreeToggle<CR>
nnoremap <silent> <F5> :NERDTreeFind<CR>

let NERDTreeIgnore = ['\.pyc$','node_modules']










"""""""""" Basic Configuration
syntax enable 
set rnu
set showcmd
set cursorline
set wildmenu
set showmatch
set incsearch
set hlsearch
set smartindent
set nopaste
set autoindent
set breakindent
set smarttab
set noswapfile
set backup
set undofile
set backupdir=~/.vim/dirs/backup
set undodir=~/.vim/dirs/undo


if !isdirectory(&backupdir)
  call mkdir(&backupdir, "p")
endif
if !isdirectory(&undodir)
  call mkdir(&undodir, "p")
endif
set rtp+=~/.vim


"" Make sure we can use our colorscheme
if !has("gui_running")
    set term=xterm
    set t_Co=256
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
    colorscheme badwolf
endif
			




"""""""""" Basic MAPPINGS 
let mapleader = " "
 
" turn off search highlight 
nnoremap <leader><space> :nohlsearch<CR>

" toggle between rnu and number
nnoremap <C-n> :call ToggleNumber()<CR>

" easy window navigation
nnoremap <silent> <c-l> <c-w>l
nnoremap <silent> <c-j> <c-w>j
nnoremap <silent> <c-h> <c-w>h
nnoremap <silent> <c-k> <c-w>k
nnoremap <silent> <leader>\ <c-^>


" wrap word
nnoremap <leader>w ysiw

" delete line
nnoremap <leader>d dd

:command! Q q
:command! W w


""""""""" Basic Functions

" toggle between number and relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc



