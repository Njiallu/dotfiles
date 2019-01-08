" Jumping to 21st century... please wait...
set nocompatible
" An abberation is about to happen, sensible people be careful
set mouse=a

"=============================================================================="
"	Start plugins                                                              "
"=============================================================================="
" I use vim plug which is an old vim package manager but has the merits of
" being multithreaded for multiple installations which speeds up the setup
" process.
call plug#begin(expand('~/.local/share/nvim/plugged'))
"=============================================================================="
"	Add or remove bundles here:
"			Snippets / Linting
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
Plug 'pbondoer/vim-42header'
"			Syntax
Plug 'scrooloose/nerdcommenter'
Plug 'justinmk/vim-syntax-extra'
Plug 'vim-scripts/ctags.vim'
Plug 'PotatoesMaster/i3-vim-syntax'
"			Useful
Plug 'mhinz/vim-startify'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'francoiscabrol/ranger.vim'
Plug 'mbbill/undotree'
Plug 'airblade/vim-gitgutter'
Plug 'wincent/terminus'
Plug 'lilydjwg/colorizer'
"			Colorschemes
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
"			Display bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"			Icons (Nerd font support)
Plug 'ryanoasis/vim-devicons'
"=============================================================================="
call plug#end()
"=============================================================================="
"	End plugins                                                                "
"=============================================================================="

"	For conceal markers
if has('conceal')
	set conceallevel=2 concealcursor=niv
endif

"=============================================================================="
"	Display                                                                    "
"=============================================================================="
if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif
try
	colorscheme gruvbox
catch
	try
		colorscheme onedark
		echom "Error: gruvbox theme couldn't be loaded, default to fallback"
	catch
		echom "Error: colorschemes couldn't be loaded!"
	endtry
endtry
set background=dark
let g:gruvbox_contrast_dark='hard'
syntax on
"		Transparency is a bit buggy with Airline
hi Normal guibg=NONE ctermbg=NONE
" hi NonText guibg=NONE ctermbg=none
"		Defaults
set title              " Enable window title
set cc=80              " Color column
set number             " Enable number gutter
set relativenumber     " Numbers on gutter are now relative
set fileencoding=utf-8 " Defaults to Utf-8
set history=500        " Commands and search patterns history limit
"		Additionals
set modeline           " enable vim modelines
set hlsearch           " highlight search items
set incsearch          " searches are performed as you type
set confirm            " ask confirmation like save before quit.
set shortmess+=aAcIws  " Hide or shorten certain messages
"		Comportement
set autoindent         " Automatic indentation
set showmatch          " Show matching bracket
set wrap               " Wrap lines
set linebreak          " Wrapping happens between words
set smartcase          " Only match case if Upper case used
set ignorecase         " Required for smartcase
set linespace=0        " Ensuring there is no space between lines
set nostartofline      " Moves the cursor at the first whitespace instead.
set noet               " No space indent
set sts=0 sw=4 ts=4    " Tabulations at 4 spaces
set path+=**           " Path for recursive file finding
if has('nvim')
	set tagcase=smart  " Nvim supports smartcase for tags
endif
"		Splits
set splitright         " Splits will happen to the right
set splitbelow         " Splits will happen to the bottom
if has('nvim')
	set inccommand=nosplit
endif
"		Menus
set showcmd            " Show successfuly executed commands
set wildmenu           " Enable menu used for completion of comands
set completeopt=menu,menuone,preview " Completion option
set clipboard=unnamed  " Clipboard used by system that default copy paste
"		WhiteSpaces
set showbreak=↪        " Wrapping char
set listchars=eol:.,tab:+-,trail:~ " Whitespace rendering
set list               " Show whitespaces
set noshowmode         " Since Airline installed no need to show mode
"		Speedups
"set gdefault           " Substition defaults to single line
"set gcr=a:blinkon500-blinkwait500-blinkoff500 " Cursor display in GUI mode
"set tm=1000 ttm=0

"=============================================================================="
"	Ale config                                                                 "
"=============================================================================="
let g:ale_sign_column_always = 1
let g:ale_completion_enabled = 1
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_linters = {'c': 'all'}
let g:ale_fixers = {}
let g:ale_lint_on_save = 1
let g:ale_statusline_format =[' %d E ', ' %d W ', '']

let g:ale_cpp_clang_options = '-std=c++14 -Wall'

"=============================================================================="
"	Airline config                                                             "
"=============================================================================="
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts=1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled=1

autocmd VimEnter * AirlineRefresh

"=============================================================================="
"	Startify config                                                            "
"=============================================================================="
let g:startify_custom_header = [
	\ '        ::::    :::     :::  :::              :::  :::       :::      ::::::::  ',
	\ '       :+:+:   :+:                           :+:  :+:      :+:      :+:    :+:  ',
	\ '      :+:+:+  +:+     +:+  +:+   .+:+:+.:+: +:+  +:+     +:+ +:+         +:+    ',
	\ '     +#+ +:+ +#+     +#+  +#+  +:++#++#++: +#+  +#+    +#+  +:+       +#+       ',
	\ '    +#+  +#+#+#     +#+  +#+  +#+     +#+ +#+  +#+   +#+#+#+#+#+   +#+          ',
	\ '   #+#   #+#+# #+# #+#  #+#  #+#+#+#+#+# #+#  #+#         #+#    #+#            ',
	\ '  ###    ####  #####   ###    ##### ### ###  ###   @     ###   ########.fr      ',
	\ ''
	\ ]

"=============================================================================="
"	Abrevations                                                                "
"=============================================================================="
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

"=============================================================================="
"	Completion settings                                                        "
"=============================================================================="
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

"=============================================================================="
"	Backup (Persistent undo) by file versioning                                "
"=============================================================================="
"		Setup backup dir
silent !mkdir ~/.vim/backups > /dev/null 2>&1
"		Setup undo dir
set undodir=~/.vim/backups
set undofile
set autowrite
"		Turn off swapfiles
set noswapfile
set nobackup
set nowb

"=============================================================================="
"	Custom functions                                                           "
"=============================================================================="

"=============================================================================="
"	Mappings                                                                   "
"=============================================================================="
"		Restore delete native comportement
set backspace=indent,eol,start
"		Maps
"	Vimrc reload
nnoremap <leader><C-r> :so $MYVIMRC <CR>
" autocmd BufWritePost .vimrc,.gvimrc,init.vim so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
"	Colorcolumn binding
nnoremap <silent> <leader><C-s> :let &cc=virtcol(".") <CR>
nnoremap <leader><C-d> :set cc=80<CR>
nnoremap <leader><C-l> :set cursorline!<CR>
"	New pane binding
nnoremap <Space><Space> :vs \| :CtrlP<CR>
"		Move between slits
nnoremap <c-h> <C-w>h
nnoremap <c-j> <C-w>j
nnoremap <c-k> <C-w>k
nnoremap <c-l> <C-w>l
nnoremap <c-Space> <C-w>p
"noremap <Up>    :echo "noob!" <CR>
"noremap <Down>  :echo "noob!" <CR>
"noremap <Left>  :echo "noob!" <CR>
"noremap <Right> :echo "noob!" <CR>
"	Move to the end of yanked text after yank and paste
nnoremap p p`]
vnoremap y y`]
vnoremap p p`]
"	Search selected text forward and backward
vnoremap <silent> / :<C-U>
			\let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
			\gvy/<C-R><C-R>=substitute(
			\escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
			\gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> ? :<C-U>
			\let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
			\gvy?<C-R><C-R>=substitute(
			\escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
			\gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> <leader>c :%s'<:'>/
