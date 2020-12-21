
" Automatically source vimrc on save.
autocmd! bufwritepost $MYVIMRC source $MYVIMRC

"""""""""" Pluggins 
call plug#begin('~/.vim/plugged')
Plug 'sheerun/vim-polyglot'
" File Explorer
Plug 'scrooloose/NERDTree'
" Auto pairs for '(' '[' '{{}{'
Plug 'jiangmiao/auto-pairs'
"Git Gutter
Plug 'airblade/vim-gitgutter'

Plug 'jacoborus/tender.vim'
"Code commenting
Plug 'scrooloose/nerdcommenter'
"Vim airline
Plug 'vim-airline/vim-airline'

" Easy motion for faster file navigation
Plug 'easymotion/vim-easymotion'

"Vim Surround
Plug 'tpope/vim-surround' 

"FZF fuzzy search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"Colorscheme  
Plug 'nanotech/jellybeans.vim'

" Or build from source code by using yarn: https://yarnpkg.com
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

Plug 'tomlion/vim-solidity'

call plug#end()


""Color scheme settings"
let g:jellybeans_overrides = {
      \    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
      \}
if has('termguicolors') && &termguicolors
  let g:jellybeans_overrides['background']['guibg'] = 'none'
endif



""Generic settings"
syntax enable 
set rnu
set cursorline
set showcmd
set wildmenu
set showmatch
set incsearch
set hlsearch
set ignorecase
set smartindent
set autoindent
set breakindent
set smarttab
set noswapfile
set undofile
set backspace=2
set encoding=utf-8
set tabstop=4

""PLUGIN CUSTOMIZATIOn"

""""""""COC""""""""
" Symbol renaming.
nmap <space>rn <Plug>(coc-rename)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif


let g:airline#extensions#tabline#enanled = 1


"FZF
nnoremap <silent> <space>f :Files<CR>
nnoremap <silent> <space>t :Rg<CR>

""" EasyMotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
nmap s <Plug>(easymotion-overwin-f)

" Move to word
nnoremap <space>w <Plug>(easymotion-w)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
""""NerdTree

set autochdir
let NERDTreeChDirMode=2
nnoremap <silent> <space>n :NERDTreeToggle . <CR>
nnoremap <silent> <F5> :NERDTreeFind<CR>

let NERDTreeIgnore = ['\.pyc$','node_modules']



" Make sure we can use our colorscheme
if !has("gui_running")
  set t_Co=256
  let &t_AB="\e[48;5;%dm"
  let &t_AF="\e[38;5;%dm"
  colorscheme jellybeans
  set guifont=Consolas:h11:cANSI
endif


if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif



"""""""""" Basic MAPPINGS 
let mapleader = " "

" toggle between rnu and number
nnoremap <C-n> :call ToggleNumber()<CR>

" Move to word
nnoremap <leader>w <Plug>(easymotion-w)


"easy window navigation
nnoremap <silent> <c-l> <c-w>l
nnoremap <silent> <c-j> <c-w>j
nnoremap <silent> <c-h> <c-w>h
nnoremap <silent> <c-k> <c-w>k
nnoremap <silent> <leader>\ <c-^>

nnoremap <silent> <leader>/ <leader>ci


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
e
