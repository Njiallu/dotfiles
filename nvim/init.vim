"Jumping to 21st century... please wait...
set nocompatible
"An abberation is about to happen, sensible people be careful
set mouse=a

"===============================================================================
"	Start plugins
"===============================================================================
call plug#begin(expand('~/.local/share/nvim/plugged'))
"===============================================================================
"	Add or remove bundles here:
"			Snippets / Linting
Plug 'w0rp/ale'
Plug 'Shougo/neocomplete'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
"			Syntax
Plug 'scrooloose/nerdcommenter'
Plug 'justinmk/vim-syntax-extra'
Plug 'vim-scripts/taglist.vim'
Plug 'vim-scripts/ctags.vim'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'chrisbra/Colorizer'
"			Useful
Plug 'mhinz/vim-startify'
Plug 'tmux-plugins/vim-tmux'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'francoiscabrol/ranger.vim'
Plug 'mbbill/undotree'
Plug 'airblade/vim-gitgutter'
"			Colorschemes
Plug 'morhetz/gruvbox'
Plug 'jacoborus/tender'
Plug 'mhinz/vim-janah'
Plug 'joshdick/onedark.vim'
Plug 'liuchengxu/space-vim-dark'
Plug 'arcticicestudio/nord-vim'
Plug 'nightsense/vimspectr'
"			Display bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"			Icons (Nerd font support)
Plug 'ryanoasis/vim-devicons'
"===============================================================================
call plug#end()
"===============================================================================
"	End plugins
"===============================================================================

"	For conceal markers
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"===============================================================================
"	Display
"===============================================================================
silent! colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark='hard'
"		Transparency but buggy with gruvbox
"hi NonText guibg=NONE ctermbg=none
hi Normal guibg=NONE ctermbg=NONE
"		Defaults
set title
set cc=80
set number
set relativenumber
set fileencoding=utf-8
set history=500
"		Speedups
set gdefault
set gcr=a:blinkon500-blinkwait500-blinkoff500
set timeoutlen=1000 ttimeoutlen=0
"		Comportement
set ai
set wrap
set showcmd
set showmatch
set linebreak
set smartcase
set ignorecase
set linespace=0
set nostartofline
if has('nvim')
	set tagcase=smart
endif
set noet sts=0 sw=4 ts=4
"		Splits
set splitright
set splitbelow
if has('nvim')
	set inccommand=nosplit
endif
"		Menus
set showcmd
set wildmenu
set completeopt=menu,menuone,preview
set clipboard=unnamed
"		WhiteSpaces
set syntax=whitespace
set showbreak=↪\
set listchars=eol:.,tab:+-,trail:~
set rnu
set list
set noshowmode
set path+=**

"===============================================================================
"	Ale config
"===============================================================================
let g:ale_sign_column_always = 1
let g:ale_completion_enabled = 1
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_linters = {'c': 'all'}
let g:ale_fixers = {}
let g:ale_lint_on_save = 1
let g:ale_statusline_format =[' %d E ', ' %d W ', '']

let g:ale_cpp_clang_options = '-std=c++14 -Wall'

"===============================================================================
"	Airline config
"===============================================================================
let g:airline_right_sep = ' '
let g:airline_left_sep = ' '
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
let g:airline_theme='gruvbox'

"===============================================================================
"	Abrevations
"===============================================================================
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qa qa
cnoreabbrev Bd bd
cnoreabbrev bD bd
cnoreabbrev wrap set wrap
cnoreabbrev nowrap set nowrap
cnoreabbrev bda BufOnly
cnoreabbrev t tabe
cnoreabbrev T tabe
cnoreabbrev f find
cnoreabbrev F find

"===============================================================================
"	Completion
"===============================================================================
set wildmode=list:full
set wildignore=*.o,*.obj,*~
set wildignore+=*.git*
set wildignore+=*vim/backups*
set wildignore+=*cache*
set wildignore+=*logs*
set wildignore+=*node_modules/**
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

"===============================================================================
"	Backup (Persistent undo)
"===============================================================================
silent !mkdir ~/.config/nvim/backups > /dev/null 2>&1
set undodir=~/.config/nvim/backups
set undofile
set autowrite
"		Turn off swapfiles
set noswapfile
set nobackup
set nowb

"===============================================================================
"	Custom functions
"===============================================================================
func! Set_column_at_cursor()
	let pos=virtcol(".")
	let &cc.= pos
endf

"===============================================================================
"	Mappings
"===============================================================================
"		Restore delete native comportement
set backspace=indent,eol,start
"		Maps
nnoremap <silent> <leader><C-f> :call Set_column_at_cursor() <CR>
nnoremap <leader><C-t> :so $MYVIMRC \| syntax enable <CR>
map <leader><C-d> :set cc=80 <CR>
map <leader><C-s> :set cursorline! <CR>
map <Space><Space> :vs \| :CtrlPBuffer<CR>
"		Move between slits
nnoremap <c-h> <C-w>h
nnoremap <c-j> <C-w>j
nnoremap <c-k> <C-w>k
nnoremap <c-l> <C-w>l
nnoremap <c-Space> <C-w>p
"noremap <Up> :echo "noob!" <CR>
"noremap <Down> :echo "noob!" <CR>
"noremap <Left> :echo "noob!" <CR>
"noremap <Right> :echo "noob!" <CR>
"		Move to the end of yanked text after yank and paste
nnoremap p p`]
vnoremap y y`]
vnoremap p p`]

set nolazyredraw

