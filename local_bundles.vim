Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-go', { 'build': 'make', 'for': ['go'] }
Plug 'deoplete-plugins/deoplete-jedi', {'for': ['python']}
Plug 'Shougo/deoplete-clangx', { 'for': ['c', 'c++']}
Plug 'Shougo/neoinclude.vim', { 'for': ['c', 'c++']}
"Plug 'deoplete-plugins/deoplete-clang', {'for': ['c', 'c++']}
"Plug 'tweekmonster/deoplete-clang2', { 'for': ['c', 'c++']}
Plug 'deoplete-plugins/deoplete-docker', {'for': ['Dockerfile']}
Plug 'deoplete-plugins/deoplete-asm', {'for': ['asm', 'assembly']}
Plug 'pbogut/deoplete-elm', {'for': ['elm']}
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdcommenter'
Plug 'ryanoasis/vim-devicons'
Plug 'roxma/nvim-yarp'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-startify'
Plug 'Shougo/echodoc.vim'
Plug 'mdempsky/gocode', { 'rtp': 'nvim', 'do': stdpath('data') . '/plugged/gocode/nvim/symlink.sh' }
Plug 'vim-scripts/dbext.vim'
Plug 'thaerkh/vim-workspace'
"Plug 'ujihisa/neco-look'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh'}
Plug 'racer-rust/vim-racer', {'for': ['rust']}
Plug 'vim-erlang/vim-erlang-tags', {'for': ['erlang']}
Plug 'vim-erlang/vim-erlang-skeletons', {'for': ['erlang']}
Plug 'vim-erlang/vim-erlang-runtime', {'for': ['erlang']}
Plug 'vim-erlang/vim-erlang-omnicomplete', {'for': ['erlang']}
Plug 'vim-erlang/vim-erlang-compiler', {'for': ['erlang']}
Plug 'vim-erlang/erlang-motions.vim', {'for': ['erlang']}
Plug 'vim-erlang/vim-rebar', {'for': ['erlang']}
Plug 'vim-erlang/vim-dialyzer', {'for': ['erlang']}
Plug 'tpope/vim-abolish'
Plug 'killphi/vim-ebnf', {'for': ['ebnf']}
Plug 'chrisbra/unicode.vim'
Plug 'vim-scripts/bnf.vim', { 'for': ['bnf']}
Plug 'jrozner/vim-antlr'
Plug 'bitc/vim-hdevtools', { 'for': ['haskell'] }
Plug 'mhartington/nvim-typescript', { 'for': ['typescript'], 'do': './install.sh' }
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'jaxbot/github-issues.vim'
Plug 'LucHermitte/lh-vim-lib'
Plug 'LucHermitte/local_vimrc'
Plug 'rhysd/vim-clang-format', { 'for': ['c', 'c++'] }
