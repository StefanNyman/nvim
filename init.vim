call plug#begin(stdpath('data') . '/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'easymotion/vim-easymotion'

Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-path'
"Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-calc'
Plug 'f3fora/cmp-spell'
Plug 'tamago324/cmp-zsh'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'

call plug#end()

colorscheme gruvbox 
set termguicolors

nmap \ :GFiles<CR>
nmap ; :Files<CR>

let mapleader=','
set clipboard+=unnamedplus

set tabstop=4
set shiftwidth=4
set expandtab

syntax on

set nobackup
set nowritebackup
set updatetime=300

nmap <leader>cc :clo<CR>
nmap <leader>vs :vsplit<CR>
nmap <leader>ss :split<CR>

set completeopt-=preview

let g:lightline = {
            \ 'colorscheme': 'gruvbox',
            \ 'active': {
            \   'left': [ ['mode', 'paste'], ['gitbranch', 'readonly', 'filename', 'modified'] ]
            \},
            \ 'component_function': {
            \   'gitbranch': 'FugitiveHead'
            \}
            \}



lua << EOF
local lspc = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspc.pyright.setup{
    capabilities = capabilities,
}
lspc.gopls.setup{
  capabilities = capabilities,
}
lspc.asm_lsp.setup{
    capabilities = capabilities,
}
lspc.awk_ls.setup{
    capabilities = capabilities,
}
lspc.bashls.setup{
    capabilities = capabilities,
}
lspc.clangd.setup{
    capabilities = capabilities,
}
lspc.clojure_lsp.setup{
    capabilities = capabilities,
}
lspc.cmake.setup{
    capabilities = capabilities,
}
lspc.dockerls.setup{
    capabilities = capabilities,
}
lspc.elixirls.setup{
    capabilities = capabilities,
}
lspc.elmls.setup{
    capabilities = capabilities,
}
lspc.erlangls.setup{
    capabilities = capabilities,
}
lspc.jqls.setup{
    capabilities = capabilities,
}
lspc.jsonnet_ls.setup{
    capabilities = capabilities,
}
lspc.lua_ls.setup{
    capabilities = capabilities,
}
lspc.nimls.setup{
    capabilities = capabilities,
}
lspc.rust_analyzer.setup{
    capabilities = capabilities,
}
lspc.texlab.setup{
    capabilities = capabilities,
}
lspc.tsserver.setup{
    capabilities = capabilities,
}
lspc.terraformls.setup{
    capabilities = capabilities,
}
lspc.zls.setup{
    capabilities = capabilities,
}

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    -- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

EOF

source $HOME/.config/nvim/plug-config/auto-cmp.lua
