" File: init.vim
" Author: rightpeter
" Description: neovim config
" Last Modified: June 27, 2018

set wildmenu
set ignorecase

set nu

" 允许在有未保存的修改时切换缓冲区，此时由vim负责保存
set hidden

" copy to system clipboard
set clipboard=unnamed

" Color theme
set termguicolors
colorscheme NeoSolarized
set background=dark

" 指定不折行
set nowrap

" Window Movement
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" map NERDTreeToggle
"silent! nmap <leader>f :NERDTreeToggle<CR>
nnoremap <M-f> :NERDTreeToggle<CR>

" Map Leader key
let mapleader=";"

" 映射全选
map <C-A> ggVG
map! <C-A> <Esc>ggVG

" Remap pop menu keys
inoremap <expr> <C-J> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <C-K> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Virtuanenv support for neovim
let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

" Vim-plug
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

Plug 'jiangmiao/auto-pairs'
Plug 'bronson/vim-trailing-whitespace'
Plug 'easymotion/vim-easymotion'
" Plug 'fholgado/minibufexpl.vim'

" Fuzzy finder
Plug 'kien/ctrlp.vim'

" File Explorer
Plug 'scrooloose/nerdtree'

" Comment Tool
Plug 'scrooloose/nerdcommenter'

" UI
Plug 'icymind/NeoSolarized'
Plug 'vim-airline/vim-airline'

" Smart Fold
Plug 'tmhedberg/SimpylFold'

" Plug 'airblade/vim-gitgutter'
" Plug 'vim-signature'

" Asynchronous Lint Engine
Plug 'w0rp/ale'

" Completion
Plug 'Shougo/deoplete.nvim'
" Python
Plug 'zchee/deoplete-jedi'
Plug 'davidhalter/jedi'

"  Snippets
Plug 'Shougo/neosnippet.vim'
Plug 'honza/vim-snippets'

" Git
Plug 'tpope/vim-fugitive'

" Undo Tree
Plug 'simnalamburt/vim-mundo'

" Initialize plugin system
call plug#end()

" Vim-go
" Plugin 'fatih/vim-go'
" Plugin 'Blackrush/vim-gocode'

" vim-react-snippets
" Plugin 'justinj/vim-react-snippets'


" frontend
" Plugin 'mattn/emmet-vim'
" Plugin 'pangloss/vim-javascript'
" Plugin 'mxw/vim-jsx'
" Plugin 'ternjs/tern_for_vim'

" Markdown
" Plugin 'JamshedVesuna/vim-markdown-preview'

" Gist
" Plugin 'mattn/webapi-vim'
" Plugin 'mattn/gist-vim'

" Shortcut for buffer contrl
nnoremap <M-w> :bd<CR>
nnoremap <M-t> :enew<CR>
nnoremap <M-[> :bp<CR>
nnoremap <M-]> :bn<CR>

" Change current directory
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

" resize current buffer by +/- 5
nnoremap <M-left> :5winc <<CR>
nnoremap <M-right> :5winc ><CR>
nnoremap <M-up> :5winc +<CR>
nnoremap <M-down> :5winc -<CR>

" SimplyFold
nnoremap <space> za
let g:SimpylFold_docstring_preview = 1

" undootree
map <M-u> :MundoToggle<CR>

" Deoplete
let g:deoplete#enable_at_startup = 1

" Neosnippet
" Enable snipMate compatibility feature.
let g:neosnippet#disable_runtime_snippets = {
\   '_' : 1,
\ }
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='$XDG_DATA_HOME/nvim/plugged/vim-snippets/snippets'

" Neosnippet Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <expr><TAB>  neosnippet#expandable_or_jumpable() ?
\ "<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" ALE Settings
let g:ale_linters = {
\   'python': ['pyls'],
\}
let g:ale_fixers = {
\   'python': ['yapf'],
\}
let g:ale_fix_on_save = 1
"let g:ale_completion_enabled = 1
" ALEGoToDefinition
nnoremap gd :ALEGoToDefinition<CR>
nnoremap <leader>v :vsp <CR>:ALEGoToDefinition<CR>
nnoremap <leader>s :sp <CR>ALEGoToDefinitionCR<CR>
" ALEFindReferences
nnoremap fr :ALEFindReferences<CR>
" ALEHover
nnoremap hv :ALEHover<CR>
let g:ale_set_balloons = 1

" Markdown
" let g:markdown_fenced_languages = ['coffe', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html']
" let vim_markdown_preview_github=1

" auto-pairs
let g:AutoPairsFlyMode = 1

" Golang
au FileType go nnoremap <leader>r :GoRun %<CR>

" Python
au FileType python nnoremap <leader>r :!python %<CR>

" javascript
" au FileType javascript setlocal ts=2 sts=2 sw=2

" html
" au FileType html setlocal ts=2 sw=2 expandtab

augroup NERDTree_autocmds

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

augroup END
