" Jumping to 21st century... please wait...
set nocompatible
" An abberation is about to happen, sensible people be careful
set mouse=a
" Auto reload config
autocmd BufWritePost $MYVIMRC source %

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
"Plug 'w0rp/ale'
"Plug 'maralla/validator.vim'
Plug 'vim-scripts/argtextobj.vim'
Plug 'vim-scripts/ctags.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mhinz/vim-crates'
"if has('nvim')
	"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
	"Plug 'Shougo/deoplete.nvim'
	"Plug 'roxma/nvim-yarp'
	"Plug 'roxma/vim-hug-neovim-rpc'
"endif
"			Syntax
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdcommenter'
Plug 'agfline/c-syntax.vim'
"Plug 'justinmk/vim-syntax-extra'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'dag/vim-fish'

" (Optional) Multi-entry selection UI.
"Plug 'junegunn/fzf'
"Plug 'ctrlpvim/ctrlp.vim'

Plug 'pbondoer/vim-42header'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'

"Plug 'scrooloose/nerdtree'
"Plug 'Xuyuanp/nerdtree-git-plugin'

if &term != "linux"
	Plug 'wincent/terminus'
	Plug 'lilydjwg/colorizer'
"			Icons (Nerd font support)
	Plug 'ryanoasis/vim-devicons'
"			Display bar
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
endif
"			Colorschemes
"Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-gruvbox8'
Plug 'joshdick/onedark.vim'
Plug 'nightsense/carbonized'
Plug 'ajmwagar/vim-deus'
Plug 'christophermca/meta5'
Plug 'dikiaap/minimalist'
Plug 'atelierbram/Base2Tone-vim'
"=============================================================================="
call plug#end()
"=============================================================================="
"	End plugins                                                                "
"=============================================================================="

"	For conceal markers
if has('conceal')
	set conceallevel=0 concealcursor=niv
endif

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
set clipboard^=unnamed,unnamedplus " Clipboard used by system that default copy paste
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
"let g:ale_sign_column_always = 1
"let g:ale_completion_enabled = 1
""let g:ale_sign_error = ''
""let g:ale_sign_warning = ''
"let g:ale_linters = {'c': 'all'}
"let g:ale_fixers = {}
"let g:ale_lint_on_save = 1
"let g:ale_statusline_format =[' %d E ', ' %d W ', '']

"let g:ale_cpp_clang_options = '-Wall -I./**/'

"let g:deoplete#enable_at_startup = 1

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
"		Select buffer
function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

"=============================================================================="
"	NerdTree customization
"=============================================================================="
map <C-b> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

" ⮜ ⮝ ⮞ ⮟ 🗲 🗴 🗸 🖉 🖍 🔥 🏳 🏲 🏱 🞴 🞹 🞺 🟂 🟆 🟊 🟌 🞀 🞁 🞂 🞃 🞅 🞏 🞙 🞛 🞠 🞤 🞥 🞫 🞬 🠴 🠵 🠶 🠷
" 🢔 🢕 🢖 🢗                           
let g:NERDTreeIndicatorMapCustom = {
	\ "Modified"  : "",
	\ "Staged"    : "🞤",
	\ "Untracked" : "🞹",
	\ "Renamed"   : "🠶",
	\ "Unmerged"  : "",
	\ "Deleted"   : "",
	\ "Dirty"     : "",
	\ "Clean"     : "",
	\ "Ignored"   : "🗲",
	\ "Unknown"   : ""
	\ }

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

"		Change colorscheme
let g:fzf_layout = { 'down': '~40%' }
nnoremap <silent> <Leader>C :call fzf#run({
\   'source':
\     map(split(globpath(&rtp, "colors/*.vim"), "\n"),
\         "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
\   'sink':    'colo',
\   'options': '+m',
\   'left':    30
\ })<CR>

"		Interract with buffers
nnoremap <silent> <Space><Space> :CocList buffers<CR>
nnoremap <silent> \<Space><Space> :vnew \| :CocList buffers<CR>
nnoremap <silent> \|<Space><Space> :new \| :CocList buffers<CR>

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



"==============================================================================

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
"inoremap <silent><expr> <TAB>
	  "\ pumvisible() ? "\<C-n>" :
	  "\ <SID>check_back_space() ? "\<TAB>" :
	  "\ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)<CR>
nmap <leader>f  <Plug>(coc-format-selected)<CR>

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

nnoremap <silent> <leader>r :Ranger<CR>
if &shell =~# 'fish$'
	set shell=sh
endif

" mkdir on save
function s:MkNonExDir(file, buf)
	if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
		let dir=fnamemodify(a:file, ':h')
		if !isdirectory(dir)
			call mkdir(dir, 'p')
		endif
	endif
endfunction
augroup BWCCreateDir
	autocmd!
	autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END
