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

" indent
setlocal ts=4 sw=4 expandtab

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
"Plug 'dense-analysis/ale'

" COC
" Use release branch (Recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Completion
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

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
" call deoplete#custom#option('sources', {
" \ '_': ['neosnippet', 'ale', 'buffer'],
" \})

" Neosnippet
" Enable snipMate compatibility feature.
" let g:neosnippet#disable_runtime_snippets = {
" \   '_' : 1,
" \ }
" let g:neosnippet#snippets_directory='$XDG_DATA_HOME/nvim/plugged/vim-snippets/snippets' 	" Tell Neosnippet about the other snippets

" Neosnippet Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
" imap <expr><TAB>  neosnippet#expandable_or_jumpable() ?
" \ "<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" ALE Settings
" let g:ale_sign_error = '⤫' 	" Error signs.
" let g:ale_sign_warning = '⚠'	" Warning signs.
" let g:ale_java_javalsp_executable = expand('~/Development/java-language-server/dist/mac/bin/launcher')
" let g:ale_java_eclipselsp_path = expand('~/Development/eclipse.jdt.ls')
" let g:ale_java_eclipselsp_workspace_path = expand('~/workplace')

" Set linters
" let g:ale_linters = {
" \   'python': ['flake8', 'pyls'],
" \   'go': ['golangserver'],
" \}
"\   'java': ['checkstyle', 'eclipselsp'],
"\   'go': ['gofmt', 'golint', 'go vet', 'gosimple']

" Set fixers
" let g:ale_fixers = {
" \   'python': ['yapf'],
" \   'go': ['gofmt', 'goimports', 'remove_trailing_lines', 'trim_whitespace'],
" \   'javascript': ['eslint', 'prettier'],
" \}
"\   'java': ['remove_trailing_lines', 'trim_whitespace'],

" Use Deocomplete by default
" let g:ale_completion_enabled = 1
" nmap <leader>f <Plug>(ale_fix)
" nnoremap gd :ALEGoToDefinition<CR>
" nnoremap <leader>v :vs <CR>:ALEGoToDefinition<CR>
" nnoremap <leader>s :sp <CR>:ALEGoToDefinition<CR>
" nnoremap <M-r> :ALEFindReferences<CR>
" nnoremap <M-H> :ALEHover<CR>
" nmap <silent> <leader>k <Plug>(ale_previous_wrap)
" nmap <silent> <leader>j <Plug>(ale_next_wrap)


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

" COC
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Python
au FileType python nnoremap <leader>r :!python %<CR>

" Java
au FileType java setlocal ts=4 sw=4 expandtab

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
