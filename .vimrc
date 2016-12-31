"========== for vim ==============
syntax enable           " 开启语法高亮
set t_Co=256            " 开启256色显示
set scrolloff=3         " 滚动时保持边距5行
set number              " 开启行号显示
set mouse=a             " 开启鼠标
set cmdheight=1
set nocompatible
set confirm 			" 在处理未保存或只读文件的时候，弹出确认
set autoindent			" 自动缩进
set tabstop=4			" Tab键的宽度
set expandtab           " 展开tab为空格
set softtabstop=4		" 统一缩进为4
set shiftwidth=4
filetype plugin indent on "打开文件类型检测, 加了这句才可以用智能补全
set completeopt=longest,menu
set hlsearch            " 高亮搜索
set laststatus=1        " 始终显示状态栏
set encoding=utf-8      " 
set ignorecase          " 搜索忽略大小写
set nopaste             " 切换到正常模式
set list lcs=tab:\¦\    " 显示对齐线 | ¦ ┆ │

colorscheme Porsche


"set cursorline   
"hi CursorLine   cterm=NONE "ctermbg=darkred ctermfg=white   
"hi CursorColumn cterm=NONE "ctermbg=darkred ctermfg=white   

set cursorline
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#30F010 ctermbg=189


"自动补全
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {<CR>}<ESC>O
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction"





"========== for quick key =======
" F11默认时全屏
nmap <F2> :NERDTreeToggle<cr>
nmap <F3> :TagbarToggle<CR>
nmap <F4> :ToggleBufExplorer<cr>
nmap <F5> :CtrlPFunky<cr>
nmap <F10> :set paste<cr>   " 切换到粘贴模式
nmap <F12> :source ~/.vimrc<cr>
nmap <silent> <leader>ll :colorscheme Porsche<cr>
nmap <silent> <leader>jj :colorscheme space-vim-dark<cr>
nmap <silent> <leader>nm :set nonumber<cr>
nmap <silent> <leader>mn :set number<cr>
nmap <silent> <leader>ag :Ag<cr>
nmap <silent> <leader>ff ::shell<cr>






"========== for NERDTree ==============
"let g:NERDTree_title='NERD Tree'
"let g:winManagerWindowLayout='NERDTree|TagList,Tarbar'

autocmd vimenter * NERDTree
nmap wm :NERDTreeToggle<cr>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") ) | q | endif

function! NERDTree_Start()
    exec 'NERDTree'
endfunction

function! NERDTree_IsValid()
    return 1
endfunction

nmap <silent> mt :if IsWinManagerVisible() <BAR> WMToggle<CR> <BAR> else <BAR> WMToggle<CR>:q<CR> endif "<CR>






"========== for CtrlP ===================
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:15,results:100'
let g:ctrlp_tabpage_position = 'al'
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_reuse_window = 'netrw\|help\|quickfix'
let g:ctrlp_open_new_file = 't'
let g:ctrlp_open_multiple_files = 'tjr'
let g:ctrlp_arg_map = 1
let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript',
                          \ 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files.
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " Ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif



"========== for CtrlPFunky ==============
nnoremap <Leader>u :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_extensions = ['funky']
let g:ctrlp_funky_syntax_highlight = 1 
let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_funky_nerdtree_include_files = 1




"========== for vim-airline ==============
let g:airline_theme="light" "light 
let g:airline#extensions#tabline#enabled = 1 
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'



"========== for EasyMotion ==============
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)



" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)





"========== for insearch ==============
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>
"set incsearch
set hlsearch

let g:incsearch#auto_nohlsearch = 0
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)





"=========== for NERDTREE-GIT-PLUGIN =====
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
