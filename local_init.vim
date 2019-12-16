
let g:startify_custom_header =[]

let g:dbext_default_profile_localPostgres = 'type=pgsql:host=localhost:user=z:passwd=:dbname=precisely_development'

colorscheme gruvbox
let g:airline_theme='bubblegum'
let g:deoplete#enable_at_startup = 1
let g:jedi#completions_enabled = 0
let g:EasyMotion_smartcase = 1

" file browser options
let g:nerdtogglecheckalllines = 1
let g:nerdcommentemptylines = 1
let g:nerdtreechdirmode=2
let g:nerdtreeignore=[]
let g:nerdtreeshowbookmarks=1
let g:nerdtree_tabs_focus_on_files=1
"let g:nerdtreeminimalui=1
let g:NERDTreeDirArrows = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeIgnore = ['^.undodir$', '^.idea$', '^.cache$']
let g:NERDTreeFileExtensionHighlightFullName = 1

let g:clang_library_path = '/usr/lib64/libclang.so'

autocmd BufEnter * if bufname('#') =~ "^NERD_tree_" && winnr('$') > 1 | b# | endif

com! FormatJSON %!python -m json.tool
com! FormatJSONSelection '<,'>python -m json.tool

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
	let g:deoplete#sort_class =['package', 'func', 'type', 'var', 'const']
	let g:deoplete#source_importer = 1
	setlocal noexpandtab tabstop=4 shiftwidth=4
	vmap <S-b> :GoDefPop<CR>
	vmap <C-b> :GoDef<CR>
	nmap <S-b> :GoDefPop<CR>
	nmap <C-b> :GoDef<CR>
	"imap <S-b> <ESC>:GoDefPop<CR>
	imap <C-b> <ESC>:GoDef<CR>
endf

"if file type is go then define go specific settings
autocmd FileType go call SetupGoEnv()

" haskell
fu! SetupHaskellEnv()
	let g:haskell_classic_highlighting = 1
	let g:haskell_indent_if = 3
	let g:haskell_indent_case = 2
	let g:haskell_indent_let = 4
	let g:haskell_indent_where = 6
	let g:haskell_indent_before_where = 2
	let g:haskell_indent_after_bare_where = 2
	let g:haskell_indent_do = 3
	let g:haskell_indent_in = 1
	let g:haskell_indent_guard = 2
	let g:haskell_indent_case_alternative = 1
	let g:haskell_enable_quantification = 1
	let g:haskell_enable_recursivedo = 1
	let g:haskell_enable_arrowsyntax = 1
	let g:haskell_enable_pattern_synonyms = 1
	let g:haskell_enable_typeroles = 1
	let g:haskell_enable_static_pointers = 1
	let g:haskell_backpack = 1
	let g:cabal_indent_section = 2
	let g:haskell_mode_completion_ghc = 0
	"setlocal omnifunc=necoghc#omnifunc
	let b:ale_linters=['stack-ghc', 'hlint', 'hdevtools']
        hi link ALEError Error
        hi Warning term=underline cterm=underline ctermfg=Yellow
        hi link ALEWarning Warning
        hi link ALEInfo SpellCap
        let g:LanguageClient_rootMarkers = ['*.cabal', 'stack.yaml']
        nnoremap <F5> :call LanguageClient_contextMenu()<CR>
        map <Leader>lk :call LanguageClient#textDocument_hover()<CR>
        map <Leader>lg :call LanguageClient#textDocument_definition()<CR>
        map <Leader>lr :call LanguageClient#textDocument_rename()<CR>
        map <Leader>lf :call LanguageClient#textDocument_formatting()<CR>
        map <Leader>lb :call LanguageClient#textDocument_references()<CR>
        map <Leader>la :call LanguageClient#textDocument_codeAction()<CR>
        map <Leader>ls :call LanguageClient#textDocument_documentSymbol()<CR>
        autocmd BufWritePre *.hs :call LanguageClient#textDocument_formatting_sync()
        au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
        au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsInfo<CR>
        au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsClear<CR>
endf
autocmd FileType haskell call SetupHaskellEnv()

set laststatus=2
set number
set ruler
set backspace=eol,start,indent
set termguicolors
set undofile
set undodir=~/.vim/undodir
set number relativenumber
set hlsearch
set ignorecase
set smartcase
set magic
set autoread
set hidden

set completeopt=noinsert,menuone,noselect
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite,*~

let g:LanguageClient_serverCommands = {
    \ 'haskell': ['hie-wrapper'],
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ }



autocmd InsertEnter,InsertLeave * set cursorline!
autocmd VimLeave * NERDTreeTabsClose
autocmd VimLeave * TagbarClose

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

let g:tagbar_type_elm = {
      \ 'kinds' : [
      \ 'f:function:0:0',
      \ 'm:modules:0:0',
      \ 'i:imports:1:0',
      \ 't:types:1:0',
      \ 'a:type aliases:0:0',
      \ 'c:type constructors:0:0',
      \ 'p:ports:0:0',
      \ 's:functions:0:0',
      \ ]
      \}

let g:elm_setup_keybindings = 0

autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif


set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__

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

if has("unix")
	let g:startify_bookmarks=['~/.config/nvim/local_init.vim', '~/.config/nvim/local_bundles.vim', '~/.config/nvim/init.vim', '~/.config/awesome', '~/work', '~/source']
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

set nobackup
set nowritebackup
set cmdheight=1
set updatetime=300
"set updatetime=700
set shortmess+=c
set signcolumn=yes
set expandtab
set noshowmode
set clipboard+=unnamed

"inoremap <silent><expr> <c-space> coc#refresh()

" gist
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_post_private = 1
" echodoc
let g:echodoc#enable_at_startup=1
let g:echodoc#type = "floating"

" workspace
let g:workspace_session_directory = $HOME . '/.cache/nvim/sessions'
let g:workspace_autosave = 0

if has('mouse')
    set mouse=a
endif

vmap <C-a> :TagbarToggle<CR>
nmap <C-a> :TagbarToggle<CR>
imap <C-a> :TagbarToggle<CR>
nmap <A-b> :Buffers<CR>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"			
noremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
map ; :Files<CR>
map <Leader>f <Plug>(easymotion-s)
map <C-o><C-o> :NERDTreeToggle<CR>
map <C-o><C-f> :NERDTreeFind<CR>
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>i
nnoremap <C-z> :undo<CR>
inoremap <C-z> <Esc>:undo<CR>i
vmap <C-x> d
nnoremap <C-r> :redo<CR>
vmap <C-c> y
nmap <C-v> p
nmap <C-m> <leader>c<space>
vmap <C-m> <leader>c<space>gv
nnoremap <C-w> :ToggleWorkspace<CR>

filetype plugin on
syntax on
filetype plugin indent on


" cscope
function! Cscope(option, query)
  let color = '{ x = $1; $1 = ""; z = $3; $3 = ""; printf "\033[34m%s\033[0m:\033[31m%s\033[0m\011\033[37m%s\033[0m\n", x,z,$0; }'
  let opts = {
  \ 'source':  "cscope -dL" . a:option . " " . a:query . " | awk '" . color . "'",
  \ 'options': ['--ansi', '--prompt', '> ',
  \             '--multi', '--bind', 'alt-a:select-all,alt-d:deselect-all',
  \             '--color', 'fg:188,fg+:222,bg+:#3a3a3a,hl+:104'],
  \ 'down': '40%'
  \ }
  function! opts.sink(lines) 
    let data = split(a:lines)
    let file = split(data[0], ":")
    execute 'e ' . '+' . file[1] . ' ' . file[0]
  endfunction
  call fzf#run(opts)
endfunction

" Invoke command. 'g' is for call graph, kinda.
nnoremap <silent> <Leader>g :call Cscope('3', expand('<cword>'))<CR>

let tokens_path = "~/.config/nvim/tokens.vim"

if filereadable(expand(tokens_path))
    source ~/.config/nvim/tokens.vim 
endif

call lh#local_vimrc#munge('whitelist', $HOME . '/source')
