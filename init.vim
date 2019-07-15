" File: init.vim
" Author: rightpeter
" Description: neovim config
" Last Modified: June 27, 2018

set wildmenu
set ignorecase

set number

set hidden " 允许在有未保存的修改时切换缓冲区，此时由vim负责保存

set clipboard=unnamed " copy to system clipboard

set nowrap " 指定不折行

" Color theme
set termguicolors
set background=dark
colorscheme solarized8

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
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-surround'

" Fuzzy finder
Plug 'kien/ctrlp.vim'

" File Explorer
Plug 'scrooloose/nerdtree'
" Comment Tool
Plug 'scrooloose/nerdcommenter'

" UI
Plug 'ap/vim-buftabline'
Plug 'lifepillar/vim-solarized8'

" Smart Fold
Plug 'tmhedberg/SimpylFold'

" Plug 'airblade/vim-gitgutter'
" Plug 'vim-signature'

" Asynchronous Lint Engine
Plug 'w0rp/ale'

" Completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Python
"Plug 'zchee/deoplete-jedi'
"Plug 'davidhalter/jedi'

" Golang
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '$XDG_CONFIG_HOME/nvim/plugged/gocode/nvim/symlink.sh' }
" Plug 'zchee/deoplete-go', { 'do': 'make'}

" frontend
" Plugin 'pangloss/vim-javascript'
" Plugin 'mxw/vim-jsx'
" Plugin 'ternjs/tern_for_vim'

" Plug 'wokalski/autocomplete-flow' 		" javascript
" Plug 'mattn/emmet-vim'				" html

"  Snippets
Plug 'Shougo/neosnippet.vim'
Plug 'honza/vim-snippets'
" Plug 'https://github.com/rightpeter/vim-snippets'

" Git
Plug 'tpope/vim-fugitive'

" Undo Tree
Plug 'simnalamburt/vim-mundo'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" Remarkjs
Plug 'idbrii/vim-remarkjs'

" PlantUML
Plug 'aklt/plantuml-syntax'
Plug 'weirongxu/plantuml-previewer.vim'
Plug 'tyru/open-browser.vim'

" Initialize plugin system
call plug#end()

" Gist
" Plugin 'mattn/webapi-vim'
" Plugin 'mattn/gist-vim'


nnoremap <M-w> :bd<CR>			" Close buffer
nnoremap <M-t> :enew<CR>		" create a new empty buffer
nnoremap <M-[> :bp<CR>			" Open previous buffer
nnoremap <M-]> :bn<CR>			" Open next buffer

nnoremap ,cd :cd %:p:h<CR>:pwd<CR> 	" Change current directory

nnoremap <M-j> <C-W>j		" Focus the buffer below
nnoremap <M-k> <C-W>k		" Focus the buffer above
nnoremap <M-l> <C-W>l		" Focus the right buffer
nnoremap <M-h> <C-W>h		" Focus the left buffer

nnoremap <M-J> <C-W>J		" Focus the buffer below
nnoremap <M-K> <C-W>K		" Focus the buffer above
nnoremap <M-L> <C-W>L		" Focus the right buffer
nnoremap <M-H> <C-W>H		" Focus the left buffer

" resize current buffer by +/- 5=
nnoremap <M-left> :2winc <<CR>		" Reduce buffer width
nnoremap <M-right> :2winc ><CR>		" Increase buffer width
nnoremap <M-up> :2winc +<CR>		" Increase buffer height
nnoremap <M-down> :2winc -<CR>		" Reduce buffer height

nnoremap <M-f> :NERDTreeToggle<CR> 	" map NERDTreeToggle

" Toggle relative number
nnoremap <leader><leader>n :set rnu!<CR>

" vim-multiple-cursors keys remap
" let g:multi_cursor_start_word_key      = '<C-j>'
" let g:multi_cursor_next_key            = '<C-j>'
" let g:multi_cursor_prev_key            = '<C-k>'
" let g:multi_cursor_exit_from_insert_mode = 0

" SimplyFold
nnoremap <space> za
let g:SimpylFold_docstring_preview = 1

" indentLine
let g:indentLine_char = '|'

" undootree
map <M-u> :MundoToggle<CR>

" Deoplete
let g:deoplete#enable_at_startup = 1
" Use ALE and also some plugin 'foobar' as completion sources for all code.
call deoplete#custom#option('sources', {
\ '_': ['ale', 'neosnippet', 'buffer'],
\})

" Neosnippet
" Enable snipMate compatibility feature.
let g:neosnippet#disable_runtime_snippets = {
\   '_' : 1,
\ }
let g:neosnippet#snippets_directory='$XDG_DATA_HOME/nvim/plugged/vim-snippets/snippets' 	" Tell Neosnippet about the other snippets

" Neosnippet Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <expr><TAB>  neosnippet#expandable_or_jumpable() ?
\ "<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" ALE Settings
let g:ale_sign_error = '⤫' 	" Error signs.
let g:ale_sign_warning = '⚠'	" Warning signs.

" Set linters
let g:ale_linters = {
\   'python': ['pyls'],
\   'go': ['golangserver'],
\   'java': ['checkstyle'],
\}
"\   'go': ['gofmt', 'golint', 'go vet', 'gosimple']

" Set fixers
let g:ale_fixers = {
\   'python': ['yapf'],
\   'go': ['gofmt', 'goimports', 'remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint', 'prettier'],
\}

" Use Deocomplete by default
" let g:ale_completion_enabled = 1
nmap <leader>f <Plug>(ale_fix)
nnoremap gd :ALEGoToDefinition<CR>
nnoremap <leader>v :vs <CR>:ALEGoToDefinition<CR>
nnoremap <leader>s :sp <CR>ALEGoToDefinitionCR<CR>
nnoremap <M-r> :ALEFindReferences<CR>
nnoremap <M-H> :ALEHover<CR>
nmap <silent> <leader>k <Plug>(ale_previous_wrap)
nmap <silent> <leader>j <Plug>(ale_next_wrap)

" auto-pairs
let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutToggle = ''

" Golang
" au FileType go nnoremap gd :exe "GoDef"<CR>
" au FileType go nnoremap <leader>v :vsp <CR>:exe "GoDef"<CR>
" au FileType go nnoremap <leader>s :sp <CR>:exe "GoDef"<CR>
" au FileType go nnoremap <leader>t :tab split<CR>:exe "GoDef"<CR>
" au FileType go nnoremap <leader>r :GoRun %<CR>
" au FileType go set list lcs=tab:\|\ 		" indentLine only support indentation using space, while gofmt using tab


" Python
au FileType python nnoremap <leader>r :!python %<CR>

" javascript
" au FileType javascript setlocal ts=2 sts=2 sw=2

" html
" au FileType html setlocal ts=2 sw=2 expandtab

" sh
au FileType sh setlocal ts=2 sts=2 sw=2

" markdown
au FileType markdown setlocal ts=2 sts=2 sw=2
au FileType markdown nnoremap <M-p> :MarkdownPreview<CR>
au FileType markdown nnoremap <M-s> :RemarkPreview<CR>

" PlantUML
au FileType plantuml setlocal ts=4 sts=4 sw=4
au FileType plantuml nnoremap <M-p> :PlantumlOpen<CR>
au FileType plantuml nnoremap <M-s> :PlantumlSave<CR>
let g:generate_diagram_theme_hand = 0

augroup NERDTree_autocmds
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

" Relative number when focus
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
