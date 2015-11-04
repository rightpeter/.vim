set wildmenu

" turn on nerd-tree
" autocmd VimEnter * NERDTree
" move the cursor
" autocmd VimEnter * wincmd p

" 允许退格键删除
set smartindent
set smarttab
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set backspace=2
set textwidth=79

" 启用鼠标

if has('mouse')
    set mouse=a
endif

behave mswin

set nu

" 文件类型

" filetype on

filetype plugin on
filetype plugin indent on

" 设置编码自动识别, 中文引号显示
" set fileencodings=utf-8, euc-tw, cp936,big5,euc-jp,euc-kr,latin1,ucs-bom
set fileencodings=utf-8
set fileencoding=utf-8
set encoding=utf-8
set termencoding=utf-8

" set ambiwidth=double

" 移动长行
nnoremap <Down> gj
nnoremap <Up> gk



" 高亮
syntax on

" 设置高亮搜索
set hlsearch

" 输入字符串就显示匹配点
set incsearch

" 输入的命令显示出来，看的清楚些。
set showcmd

" 指定不折行
set nowrap

" 水平滚动
set guioptions+=b


" <F2>code_complete.vim插件：函数自动完成
"if !exists("g:completekey")
"    let g:completekey = "<F2>" "hotkey
"endif

" 文件树装列表
" map <F2> :NERDTree<CR>
silent! nmap <C-x> :NERDTreeToggle<CR>
silent! map <F2> :NERDTreeFind<CR>

let g:NERDTreeMapActivateNode="<F2>"
let g:NERDTreeMapPreview="<F3>"

" Tagbar
map <F4> :Tagbar<CR>

" Taglist
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
" let Tlist_File_Fold_Auto_Close=1
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

set updatetime=1000

" 当前目录生成tags语法文件，用于自动完成，函数提示： code_complete.vim OmniCppComplete.vim ...
" map <F5> :!ctags -R --c-kinds=+p --fields=+S. <CR>
map <F6> :Tlist<CR>
map <F7> :!ctags -R --c-kinds=+p --c++-kinds=+p --fields=+iaS --extra=+q <CR>

set tags+=/usr/include/tags,
set tags+=/usr/lib/tags,
" set tags+=/usr/local/lib/tags,
set tags+=/usr/local/lib/python2.7,
" set tags+=~/Source/path/to/tags/cpp,

let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 "显示函数参数列表
let OmniCpp_MayCompleteDot = 1 "输入 . 后自动补全
let OmniCpp_MayCompleteArrow = 1 "输入 -> 后自动补全
let OmniCpp_MayCompleteScope = 1 "输入 :: 后自动补全
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

highlight Pmenu     guibg=darkgrey  guifg=black
highlight PmenuSel  guibg=lightgrey guifg=black

" 自动关闭补全窗口
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest

" 按 F9 智能补全
inoremap <F9> <C-x><C-o>

" vim 自动补全 Python 代码

" 来自http://vim.sourceforge.net/scripts/script.php?script_id=850

autocmd FileType python set complete+=k~/.vim/tools/pydiction

" 自动使用新文件模板

"autocmd BufNewFile *.py 0r ~/.vim/template/simple.py

" 映射全选
map <C-A> ggVG
map! <C-A> <Esc>ggVG

" 多行缩进
map <Tab> >
map <S-Tab> <

" 插件设置
set nocp

" 2Html插件, 启用XHtml css
let html_number_lines=1
" let html_use_css=1
let use_xhtml=1

" html format
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
let g:html_indent_inctags = "html,body,head"

" fencview.vim 插件设置
" let g:fencview_autodetect = 1 "打开文件时自动识别编码
let g:fencview_autodetect = 0 " 打开文件时不自动识别编码
" let g:fencview_checklines = 10 "检查前后10行来判断编码

" autocomplpop.vim & supertab.vim 插件设置
let g:AutoComplPop_IgnoreCaseOption=1
map <F9> :FencView<CR>

set ignorecase

" 其他设置


"Format the statusline

"Nice statusbar

set laststatus=2

set statusline=

set statusline+=%2*%-3.3n%0*\ " buffer number

set statusline+=%f\ " file name

set statusline+=%h%1*%m%r%w%0* " flag

set statusline+=[

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

if v:version >= 600

set statusline+=%{strlen(&ft)?&ft:'none'}, " filetype

set statusline+=%{&encoding}, " encoding

endif

set statusline+=%{&fileformat}] " file format

" if filereadable(expand("$VIM/vimfiles/plugin/vimbuddy.vim"))
" 
" set statusline+=\ %{VimBuddy()} " vim buddy
" 
" endif

set statusline+=%= " right align

set statusline+=%2*0x%-8B\ " current char

" set statusline+=0x%-8B\ " current char

set statusline+=%-14.(%l,%c%V%)\ %<%P " offset

let g:pydiction_location='~/.vim/after/ftplugin/pydiction/complete-dict'

" paste to system
vmap "+y :w !pbcopy<CR><CR>
nmap "+p :r !pbpaste<CR><CR>

" fold
set foldmethod=indent

" vundle
set nocompatible      " be iMproved
set rtp+=~/.vim/bundle/vundle/

call vundle#begin()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" vim-scripts repos
" ready!
Bundle 'AutoClose'
Bundle 'ShowTrailingWhitespace'
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
Bundle 'ctrlp.vim'
Bundle 'EasyMotion'
Bundle 'matchit.zip'
Bundle 'fencview.vim'

" todo:
" Bundle 'snipMate'
" Bundle 'vim-plugin-foo'
" Bundle 'vim-plugin-bar'

" Git Vim
Plugin 'tpope/vim-fugitive'

" ZenCoding
Plugin 'mattn/emmet-vim'

" Vim-go
Plugin 'fatih/vim-go'

" YCM
Plugin 'Valloric/YouCompleteMe'

" Go Env
Plugin 'scrooloose/syntastic'
" Plugin 'dgryski/vim-godef'
Plugin 'Blackrush/vim-gocode'
Plugin 'majutsushi/tagbar'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-unimpaired'

call vundle#end()

map <D-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <D-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
" GoDef
au FileType go nnoremap <leader>v :vsp <CR>:exe "GoDef"<CR>
au FileType go nnoremap <leader>s :sp <CR>:exe "GoDef"<CR>
au FileType go nnoremap <leader>t :tab split <CR>:exe "GoDef"<CR>
au FileType go nnoremap <leader>r :GoRun %<CR>

" Markdown with fenced code blocks highlighting
au BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['coffe', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html']

" Change current directory
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

" resize current buffer by +/- 5
" nnoremap <C-left> :5winc <<CR>
" nnoremap <C-right> :5winc ><CR>
" nnoremap <C-up> :5winc +<CR>
" nnoremap <C-down> :5winc -<CR>

" Syntastic syntax
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_post_args='--ignore=E501'
nnoremap <C-\> :SyntasticToggleMode<CR>
