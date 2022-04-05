let mapleader="\<Space>"

call plug#begin()

    Plug 'vim-airline/vim-airline'
    Plug 'tpope/vim-commentary'
    Plug 'vimwiki/vimwiki'
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

" Basic settings:
    set termguicolors
    set clipboard+=unnamedplus
    set hidden
    set cursorline
    set number relativenumber
    set scrolloff=5
    set foldmethod=indent

" Edit settings:
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set expandtab

" Splits open at the bottom and right:
    set splitbelow splitright

" Shortcutting split navigation:
    map <C-h> <C-w>h
    map <C-j> <C-w>j
    map <C-k> <C-w>k
    map <C-l> <C-w>l

" Remove search highlight:
    nnoremap <silent> <leader>h :nohlsearch<CR>

" Fzf.vim:
    nnoremap <silent><leader>b :Buffers<CR>
    nnoremap <silent><leader>f :Files<CR>
    let g:fzf_layout = { "down": "40%" }

" Vimwiki :
    let g:vimwiki_list = [{'path': '~/Documents/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
    let g:vimwiki_table_mappings = 0

" Markdown-preview.nvim:
    let g:mkdp_auto_close = 0
    let g:mkdp_refresh_slow = 1

" Dracula colorscheme:
    let g:dracula_colorterm = 0
    colorscheme dracula
