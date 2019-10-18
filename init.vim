set encoding=utf-8

"so ~/.vim/plugins.vim

call plug#begin('~/.local/share/nvim/plugged')

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

call plug#end()


let g:deoplete#enable_at_startup = 1
let g:jedi#completions_enabled = 0
let g:EasyMotion_smartcase = 1
let g:NERDToggleCheckAllLines = 1
let g:NERDCommentEmptyLines = 1

" go stuff

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
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

" elixir stuff
let g:mix_format_on_save = 1

map ; :Files<CR>
map <C-o><C-o> :NERDTreeToggle<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nmap <S-b> :GoDefPop<CR>
nmap <C-b> :GoDef<CR>
map <F8> :TagbarToggle<CR>
map <Leader>s <Plug>(easymotion-s)
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>i
nnoremap <C-z> :undo<CR>
inoremap <C-z> <Esc>:undo<CR>i
vmap <C-x> d
nnoremap <C-r> :redo<CR>
vmap <C-c> y
nmap <C-v> p
imap <C-v> <Esc>pi
nmap <C-m> <leader>c<space>
vmap <C-m> <leader>c<space>gv
nmap <C-a> :TagbarToggle<CR>
imap <C-a> :TagbarToggle<CR>
"au filetype go inoremap <buffer> . .<C-x><C-O>

filetype plugin on

set laststatus=2
set number

colorscheme gruvbox
syntax on

set encoding=utf-8
set fileencoding=utf-8
set ruler
set backspace=eol,start,indent
set termguicolors
set undofile
set undodir=~/.vim/undodir

set hlsearch
set ignorecase
set smartcase
set lazyredraw
set magic
set autoread

set completeopt-=preview


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





