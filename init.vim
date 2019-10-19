
call plug#begin(stdpath('data') . '/plugged')
	Plug 'airblade/vim-gitgutter'
	Plug 'editorconfig/editorconfig-vim'
	Plug 'itchyny/lightline.vim'
	Plug 'junegunn/fzf'
	Plug 'junegunn/fzf.vim'
	Plug 'scrooloose/nerdtree'
	Plug 'terryma/vim-multiple-cursors'
	Plug 'tpope/vim-eunuch'
	Plug 'tpope/vim-surround'
	Plug 'w0rp/ale'
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
	Plug 'majutsushi/tagbar'
	Plug 'jiangmiao/auto-pairs'
	Plug 'scrooloose/nerdcommenter'
	Plug 'easymotion/vim-easymotion'
	Plug 'elixir-editors/vim-elixir'
	Plug 'mhinz/vim-mix-format'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'tpope/vim-fugitive'
	Plug 'davidhalter/jedi-vim'
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'deoplete-plugins/deoplete-go', { 'build': 'make' }
	Plug 'mhinz/vim-startify'
	Plug 'ryanoasis/vim-devicons'
	Plug 'neoclide/coc.nvim', { 'branch': 'release' }
call plug#end()

let g:deoplete#enable_at_startup = 1
let g:jedi#completions_enabled = 0
let g:EasyMotion_smartcase = 1

" file browser options
let g:NERDToggleCheckAllLines = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=[]
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMinimalUI=1

fu! SetupGoEnv()
	let g:go_highlight_types = 1
	let g:go_highlight_fields = 1
	let g:go_highlight_functions = 1
	let g:go_highlight_function_calls = 1
	let g:go_highlight_operators = 1
	let g:go_highlight_extra_types = 1
	let g:go_highlight_build_constraints = 1
	let g:go_auto_type_info = 1
	let g:go_fmt_command = "goimports"
	let g:deoplete#sources#go#package_dot = 1
	setlocal noexpandtab tabstop=4 shiftwidth=4
	map <S-b> :GoDefPop<CR>
	map <C-b> :GoDef<CR>
endf
"if file type is go then define go specific settings
autocmd FileType go call SetupGoEnv()

if has('win32')
	" ugly way to set the python exec path. will break on different python
	" version.
	let g:python3_host_prog = "C:\\Program\ Files\ (x86)\\Python37-32\\python.exe"
endif

" elixir stuff
let g:mix_format_on_save = 1

map ; :Files<CR>
map <C-o><C-o> :NERDTreeToggle<CR>
" map shortcuts for changing window
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
map <Leader>s <Plug>(easymotion-s)
" map ctrl-s/v/c/x/z
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>i
nnoremap <C-z> :undo<CR>
inoremap <C-z> <Esc>:undo<CR>i
vmap <C-x> d
nnoremap <C-r> :redo<CR>
vmap <C-c> y
nmap <C-v> p
map <C-v> <Esc>pi
nmap <C-m> <leader>c<space>
vmap <C-m> <leader>c<space>gv
nmap <C-a> :TagbarToggle<CR>
imap <C-a> :TagbarToggle<CR>

noremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

filetype plugin on

colorscheme gruvbox
syntax on

set encoding=utf-8
set fileencoding=utf-8
set laststatus=2
set number
set ruler
set backspace=eol,start,indent
set termguicolors
set undofile
set undodir=~/.vim/undodir
set number relativenumber
set cursorline
set hlsearch
set ignorecase
set smartcase
set lazyredraw
set magic
set autoread
" allow buffer switch without saving
set hidden

set completeopt-=preview
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite


if has('mouse')
	set mouse=a
endif

let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\}


autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif


"fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
if has("unix")
	let $FZF_DEFAULT_COMMAND = "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o -type f -print -o -type 1 -print 2>/dev/null"
endif
let $FZF_DEFAULT_OPTS=' --color=dark --color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:0,hl+:1 --color=info:0,prompt:0,pointer:12,marker:4,spinner:11,header:-1 --layout=reverse --margin=1,4'
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

fu! FloatingFZF()
	let buf = nvim_create_buf(v:false, v:true)
	call setbufvar(buf, '&signcolumn', 'no')
	let height = float2nr(20)
	let width = float2nr(80)
	let horizontal = float2nr((&columns - width) / 2)
	let vertical = 1
	let opts = {
				\ 'relative': 'editor',
				\ 'row': vertical,
				\ 'col': horizontal,
				\ 'width': width,
				\ 'height': height,
				\ 'style': 'minimal'
				\}
	call nvim_open_win(buf, v:true, opts)
endf

" startify
if has("unix")
	let g:startify_bookmarks=['~/.bashrc', '~/config/nvim/init.vim', '~/.config/awesome', '~/work', '~/source']
endif
if has("win32")
	let g:startify_bookmarks=['']
endif

let g:startify_lists = [
			\{ 'type': 'sessions', 'header': ['  Sessions'] },
			\{ 'type': 'files', 'header': ['  Recent Files'] },
			\{ 'type': 'dir', 'header': ['  Recent Files in: ' . getcwd()] },
			\{ 'type': 'bookmarks', 'header': ['  Bookmarks'] },
			\{ 'type': 'commands', 'header': ['  Commands'] },
			\]

"ale (async linting)
let g:ale_sign_highlight_linenrs=1
let g:ale_linters={}
let g:airline#extensions#ale#enabled=1
let g:formatdef_eslint='"eslint-formatter"'
let g:formatters_javascript=['prettier', 'eslint']
let g:ale_fix_on_save=1
let g:ale_lint_on_text_changed='always'
let g:ale_echo_cursor=1

"devicons
let g:webdevicons_enable=1
let g:webdevicons_enable_nerdtree=1
let g:webdevicons_enable_airline_statusline=1
let g:webdevicons_enable_airline_tabline=1
let g:WebDevIconsNerdTreeGitPluginForceVAlign=1

"coc
let g:airline#extensions#coc#enabled=1
set hidden
set nobackup
set nowritebackup
set cmdheight=1
set updatetime=300
set shortmess+=c
set signcolumn=yes

inoremap <silent><expr> <c-space> coc#refresh()


