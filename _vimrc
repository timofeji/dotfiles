
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


" Easy motion for faster file navigation
Plug 'easymotion/vim-easymotion'

" Track the engine.
Plug 'SirVer/ultisnips'

" Generic Snippets for all languages
Plug 'honza/vim-snippets'

" Nerd Tree
Plug 'scrooloose/nerdtree'

"Vim Surround
Plug 'tpope/vim-surround' 

"Vim Dispatch
Plug 'tpope/vim-dispatch'

"Git Gutter
Plug 'airblade/vim-gitgutter'

"Code commenting
Plug 'scrooloose/nerdcommenter'

"Colorscheme
Plug 'josuegaleas/jay'

"Vim-sessions for easy session management
Plug 'xolox/vim-session' | Plug 'xolox/vim-misc'

"Vim airline
Plug 'vim-airline/vim-airline'

"Command-T for fuzzy file search
Plug 'wincent/command-t', {
    \   'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
    \ }


function! Installjshint(info)
	if a:info.status == 'installed' || a:info.force
		!npm install -g jshint
	endif
endfunction

" Syntastic for syntax checking
Plug 'scrooloose/syntastic', { 'do': function('Installjshint') }


Plug 'Valloric/YouCompleteMe', { 'do': './install.py --all' }



""" Languages support
"Typescript Supports
Plug 'leafgarland/typescript-vim'

"GDScript Support
Plug 'quabug/vim-gdscript'

"C# Support
Plug 'OmniSharp/omnisharp-vim'

call plug#end()


"""Sessions
let g:session_autoload = 'no'



"""UltiSnips
 let g:UltiSnipsExpandTrigger="<c-j>"
 let g:UltiSnipsJumpForwardTrigger="<c-b>"
 let g:UltiSnipsJumpBackwardTrigger="<c-z>"

 " If you want :UltiSnipsEdit to split your window.
 let g:UltiSnipsEditSplit="vertical"




 """Syntastic
 set statusline+=%#warningmsg#
 set statusline+=%{SyntasticStatuslineFlag()}
 set statusline+=%*

 let g:syntastic_always_populate_loc_list = 1
 let g:syntastic_auto_loc_list = 1
 let g:syntastic_check_on_open = 1
 let g:syntastic_check_on_wq = 0

 let g:syntastic_javascript_checkers=['eslint']
 let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']


"""" Command-T
set wildignore+=node_modules/*




"""" OmniSharp
let g:OmniSharp_want_snippet=1




""""NerdTree
nnoremap <silent> <F4> :NERDTreeToggle<CR>
nnoremap <silent> <F5> :NERDTreeFind<CR>

let NERDTreeIgnore = ['\.pyc$','node_modules']


""" EasyMotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
nmap s <Plug>(easymotion-overwin-f)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" Move to word
nnoremap <leader>w <Plug>(easymotion-w)



"""""""""" Basic Configuration
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
set nopaste
set autoindent
set breakindent
set smarttab
set noswapfile
set backup
set undofile
set backupdir=~/.vim/dirs/backup
set undodir=~/.vim/dirs/undo
set backspace=2
set encoding=utf-8
set tabstop=4
hi CursorLine term=bold cterm=bold guibg=Grey40

filetype plugin on

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
	set background=dark
	colorscheme jay 
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

"CMDER fix
inoremap <Char-0x07F> <BS>
nnoremap <Char-0x07F> <BS>



let s:ruby_path = 'C:\Ruby187\bin'


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



