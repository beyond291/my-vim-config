" let s:ProjectDir="my-project-tags"
let s:ProjectDir="."

" disable some plugin
let g:pathogen_disabled = []
"call add(g:pathogen_disabled, 'clang_complete')
"call add(g:pathogen_disabled, 'neocomplcache-clang_complete')
" call add(g:pathogen_disabled, 'snipMate_HW')
call add(g:pathogen_disabled, 'echofunc')
call add(g:pathogen_disabled, 'OmniCppComplete') "must be the last one

if filereadable(s:ProjectDir."/project-setting.vim") "工程配置文件的名字
    exec "source ".s:ProjectDir."/project-setting.vim"
endif

filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"vim: set fenc=utf-8:
set nocompatible
" source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin

if has("gui_running")
    set encoding=chinese
    set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,euc-kr,latin1
    if has("win32")
        set fileencoding=chinese
    else
        set fileencoding=utf-8
    endif

    let &termencoding=&encoding

    " 解决菜单乱码
    set langmenu=zh_CN.utf-8
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim

    " 解决consle输出乱码
    language messages en_US.utf-8
    " colorscheme wombat
    colorscheme darkZ
else

    if has("win32")
        set encoding=cp936
    else
        set encoding=utf-8
    endif
    
    set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,euc-kr,latin1
    if has("win32")
        set fileencoding=cp936
        set termencoding=cp936
    else
        set fileencoding=utf-8
        set termencoding=utf-8
    endif

    set t_Co=256
    colorscheme wombat256
    map <ESC>[32~ <S-F8> "let <S-F8> work for me
endif

"let &termencoding=&encoding
if has("win32")
"set gfn=YaHei\ Consolas\ Hybrid:h10
else
    "set gfn=YaHei\ Consolas\ Hybrid\ 11
    "set gfn=YaheiMono\ 10
   "set gfn=Liberation\ Mono\ 11
   "set gfn=Bitstream\ Vera\ Sans\ Mono\ 10
   set gfn=WenQuanYi\ Micro\ Hei\ Mono\ 10
endif

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set wildmode=longest,list
set wildmenu

"最大化
if has('win32')
    au GUIEnter * simalt ~x
else
    au GUIEnter * call MaximizeWindow()
endif
function! MaximizeWindow()
    silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunction

autocmd BufEnter * :syntax sync fromstart

"去掉鼠标功能
set mouse-=a
"光标不闪
set gcr=a:blinkon0

"设置','为leader快捷键
let mapleader = ","
let g:mapleader = ","

filetype off
"Enable filetype plugin
filetype plugin indent on

"custom file type
au BufNewFile,BufRead *.inc set filetype=C
au BufNewFile,BufRead *.INC set filetype=C

"remove spaces
nmap <f12> :%s= *$==<cr>

nmap <leader>o :only<cr>

"Fast saving
nmap <silent> <leader>ww :w<cr>
nmap <silent> <leader>WW :w<cr>
nmap <silent> <leader>wf :w!<cr>
nmap <silent> <leader>WF :w!<cr>

"Fast quiting
nmap <silent> <leader>qw :wq<cr>
nmap <silent> <leader>qf :q!<cr>
nmap <silent> <leader>qq :cclose<cr>:q<cr>
nmap <silent> <leader>qa :qa<cr>

"search
vnoremap <silent> ,/ y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
vnoremap <silent> ,? y?<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>

"Fast remove highlight search
nmap <silent> <SPACE> :nohl<cr>

"Fast redraw
nmap <silent> <leader>rr :redraw!<cr>

set nolinebreak
set wrap
set number
set so=1
set sidescrolloff=1
set sidescroll=1
set makeprg=make
set tabstop=4
set softtabstop=4
set shiftwidth=4
syn on
compiler gcc
set guioptions-=T
set guioptions-=r
set guioptions-=L
set guioptions+=i
set guioptions-=m
set guioptions+=c
set fileformat=unix
"set fileformats=unix
set cindent
set autoindent
set nocompatible
set expandtab
set smarttab
set linespace=0
set foldopen-=search " don't open folds when you search into them
set foldopen-=undo " don't open folds when you undo stuff
set fsync
set laststatus=2
""set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\[HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
""set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [POS=%04l,%03v][%p%%]\ [LEN=%L]
"set statusline=%F%m%r%h%w%=%k\ [FORMAT=%{&ff}]\ [%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ [POS=%04l,%03v][%p%%]\ [LEN=%L]
set nocursorline
set nocursorcolumn
set undolevels=1000
set history=1000
set nobackup
set noswapfile
"set updatecount=1000
set sessionoptions+=unix,slash
set hlsearch
set incsearch
"set ignorecase
set noerrorbells
set pastetoggle=<F2>
nnoremap j gj
nnoremap k gk
cmap w!! w !sudo tee % >/dev/null

set modelines=10
set modeline

"Favorite filetypes
set ffs=unix,dos
nmap <leader>fd :se ff=dos<cr>
nmap <leader>fu :se ff=unix<cr>

" Hide the mouse when typing text
set mousehide

set hidden

nmap <C-H> <C-W>h 
nmap <C-J> <C-W>j 
nmap <C-K> <C-W>k 
nmap <C-L> <C-W>l


"Quickfix
nmap <leader>cd :cn<cr>
nmap <leader>cp :cp<cr>
nmap <leader>cw :botright copen<cr>
nmap <leader>cq :cclose<cr>
nmap <leader>lq :lclose<cr>
"nmap <leader>gc :G /\<<c-r>=expand("<cword>")<cr>\>/<cr>
"nmap <leader>ga :Grep /\<<c-r>=expand("<cword>")<cr>\><cr>
nmap <leader>cb :botright cwindow<cr>

nmap <leader>qo :QFix<CR>
nmap <leader>ft :call QFixToggle(1)<CR>
command! -bang -nargs=? QFix call QFixToggle(<bang>0)
 
function! QFixToggle(forced)
    if exists("g:qfix_win") && a:forced != 0
        cclose
    else
        if exists("g:my_quickfix_win_height")
            execute "copen ".g:my_quickfix_win_height
        else
            botright copen
        endif
    endif
endfunction
 
augroup QFixToggle
    autocmd!
    autocmd BufWinEnter quickfix let g:qfix_win = bufnr("$")
    autocmd BufWinLeave * if exists("g:qfix_win") && expand("<abuf>") == g:qfix_win | unlet! g:qfix_win | endif
augroup END

function! s:Loadtags(ctags, cscope)
    let s:cur_dir = getcwd()."/"

    if a:ctags == 1
        if filereadable(s:ProjectDir."/tags")
            exec "set tags=".s:cur_dir.s:ProjectDir."/tags"
        endif
    endif

    if a:cscope == 1
        if filereadable(s:ProjectDir."/GTAGS")                "设置tag文件的名字
            set csprg=gtags-cscope
            exec "cs add ".s:cur_dir.s:ProjectDir."/GTAGS"
        elseif filereadable(s:ProjectDir."/cscope.out")                "设置tag文件的名字
            set csprg=cscope
            exec "cs add ".s:cur_dir.s:ProjectDir."/cscope.out"
        endif
    endif
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")
    "set csto=1
    set csto=0
    set cst
    "set nocsverb
    "set csverb
    call s:Loadtags(0, 1)
endif
"set cscopequickfix=s-!,c-!,d-!,i-!,t-!,e-!,g-!,f-!
"set cscopequickfix=s-,c-,d-,i-,t-,e-,g-,f-
"
let s:NeoCompleteEnable = 0
if !s:NeoCompleteEnable
    let g:AutoCompletePopEnable = 1
    nmap <leader>gs :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>gg :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>gc :cs find c <C-R>=expand("<cword>")<CR><CR>
    "nmap <leader>gt :cs find t <C-R>=expand("<cword>")<CR><CR>
    "nmap <leader>ge :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>gf :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <leader>gi :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <leader>gd :cs find d <C-R>=expand("<cword>")<CR><CR>
else
    let g:AutoCompletePopEnable = 0
    nmap <leader>gs :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>gg :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>gc :cs find c <C-R>=expand("<cword>")<CR><CR>
    "nmap <leader>gt :cs find t <C-R>=expand("<cword>")<CR><CR>
    "nmap <leader>ge :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>gf :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <leader>gi :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <leader>gd :cs find d <C-R>=expand("<cword>")<CR><CR>
endif

function! DisplayTagInLeftWin()
    let s:cur_world = expand("<cword>")
    "execute "wincmd L"

    " Reuse or create new buffer. Based on code in Decho
    " http://www.vim.org/scripts/script.php?script_id=120
    "if exists("g:rrbufnr") && bufwinnr(g:rrbufnr) > 0
    if exists("g:rrbufnr")
        "echomsg "already has window!"
        "exe "keepjumps ".bufwinnr(g:rrbufnr)."wincmd W"
        exe "keepjumps ".bufwinnr('-TagResults_')." wincmd w"
        "exe 'normal ggdG' "clean buffer
    else
        "echomsg "new window!"
        "exe "keepjumps silent! vs"
        exe 'keepjumps silent! vs -TagResults-'
        let g:rrbufnr=bufnr('%')
    end

    execute "tag ".s:cur_world
endfunction
set splitright
nmap <S-F8> :call DisplayTagInLeftWin()<CR>

nmap <F7> :pop<CR>
nmap <F8> :tag <C-R>=expand("<cword>")<CR><CR>
"nmap <leader>gs :cs find s 
"nmap <leader>gg :cs find g 
"nmap <leader>gc :cs find c 
"nmap <leader>gt :cs find t 
"nmap <leader>ge :cs find e 
"nmap <leader>gf :cs find f 
"nmap <leader>gi :cs find i 
"nmap <leader>gd :cs find d 

"nmap <C-t> :colder<CR>:cc<CR>
"nmap <F3> :cclose<cr>:botright copen<cr><C-W>k


"set complete
set completeopt=longest,menuone
" set completeopt=menuone,menu,longest

"compview
let g:cvWindowPosition = 0

"Doxygen
"let g:DoxygenToolkit_briefTag_pre="@Descripton "
"let g:DoxygenToolkit_paramTag_pre="@Param "
"let g:DoxygenToolkit_returnTag="@Returns   "
"let g:DoxygenToolkit_blockHeader="******************************************"
"let g:DoxygenToolkit_blockFooter="******************************************"
let g:doxygenToolkit_briefTag_funcName="yes"
let g:DoxygenToolkit_authorName="xuyufeng"
let g:DoxygenToolkit_licenseTag="ifreecomm"

"补全映射
inoremap <expr> <CR>       pumvisible()?"\<C-Y>":"\<CR>"
"inoremap <expr> <SPACE>       pumvisible()?"\<C-Y>":"\<SPACE>"
inoremap <expr> <C-J>      pumvisible()?"\<PageDown>":"\<C-X><C-O>"
inoremap <expr> <C-K>      pumvisible()?"\<PageUp>":"\<C-K>"
inoremap <expr> <C-U>      pumvisible()?"\<C-E>":"\<C-U>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable folding, I find it very useful
"set fen
set fdl=9999
"nmap <silent> <leader>zo zO
"vmap <silent> <leader>zo zO
"nmap <silent> <leader>zc zC
"vmap <silent> <leader>zc zC

""设置语法折叠
"set foldmethod=syntax
"set foldcolumn=1 "设置折叠区域的宽度
"set foldclose=all "设置为自动关闭折叠
"
"" 用空格键来开关折叠
"set foldenable
"nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
"autocmd FileType c,cpp  setl fdm=syntax | setl fen

"supertab
"let g:SuperTabRetainCompletionType = 2
let g:SuperTabDefaultCompletionType = "<C-X><C-U>"

" Buf Explorer
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 30  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.
autocmd BufEnter \[BufExplorer\] :set number

""""""""""""""""""""""""""""""
"fuzzy finder,
""""""""""""""""""""""""""""""
" let g:LookupFile_TagExpr = '"./my-project-tags/filenametags"'
let g:LookupFile_TagExpr = '"./filenametags"'
"let g:fuf_modesDisable = [ 'mrufile', 'mrucmd', 'tag', 'taggedfile']
let g:fuf_modesDisable = [ 'mrufile', 'mrucmd', 'tag' ]
let g:fuf_infoFile = ''
let g:fuf_enumeratingLimit = 30
let g:my_enumeratingLimit = 500

if 0
    "nmap <F2> :AutoComplPopDisable<cr>:FufFile<cr>
    nmap <leader>tt :AutoComplPopDisable<cr>:FufBufferTag<cr>
    "nmap <leader>ff :AutoComplPopDisable<cr>:FufQuickfix<cr>
    nmap <leader>jj :AutoComplPopDisable<cr>:FufJumpList<cr>
    nmap <leader>bb :AutoComplPopDisable<cr>:FufBuffer<cr>
    nmap <F5> :AutoComplPopDisable<cr>:FufTaggedFile<cr>
else
    nmap <leader>tt :FufBufferTag<cr>
    nmap <leader>ff :FufQuickfix<cr>
    nmap <leader>jj :FufJumpList<cr>
    nmap <leader>bb :FufBuffer<cr>
    nmap <F5> :FufTaggedFile<cr>
endif

"command-t
nmap <leader>ct :CommandT<CR>
set wildignore+=*.o,*.obj,.git,.svn,*.a,*.obj,*.cmd,*png,*so
let g:CommandTMaxFiles=30000

""""""""""""""""""""""""""""""
" Tag list (ctags)
""""""""""""""""""""""""""""""
let Tlist_Ctags_Cmd = 'ctags'
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口 
let Tlist_WinWidth = 35 
let Tlist_Display_Prototype = 0
call s:Loadtags(1, 0)
map <f10> :TlistToggle<cr>
set updatetime=100


"nmap <silent> <leader>lv :vimgrep /<c-r>=expand("<cword>")<cr>/ %<cr>:botright open<cr>


if has("win32")
    "grep setting
    "nnoremap <silent> <F4> :Grep<CR>
    nnoremap <silent> <F4> :Rgrep<CR> 
    "let Grep_Default_Filelist = '*.c *.cpp *.hpp *.h *.s *.inc *.INC *.C *.S'
    let Grep_Path =  'D:/cygwin/bin/grep.exe'
    let Fgrep_Path = 'D:/cygwin/bin/fgrep.exe'
    let Egrep_Path = 'D:/cygwin/bin/egrep.exe'
    let Agrep_Path = 'D:/cygwin/bin/agrep.exe'
    let Grep_Find_Path = 'D:\cygwin\bin\find.exe'
    let Grep_Xargs_Path = 'D:\cygwin\bin\xargs.exe'
    let Grep_Default_Options = '-i'
    let Grep_Shell_Quote_Char = "'" 
    "let Grep_Shell_Escape_Char = '"' 
endif
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn .project lib obj'
let Grep_Skip_Files = '*.bak *.o *.a *.obj *.out *.oe674 *.pch *.sem3 *.oem3 *.map'

function! SaveSession()
    exec "set sessionoptions-=curdir"
    exec "set sessionoptions+=sesdir"
    exec "mksession! ".s:ProjectDir."/project.vim"
    exec "wviminfo! ".s:ProjectDir."/project.viminfo"
endfunction

function! LoadSession()
    exec "source ".s:ProjectDir."/project.vim"
    exec "rviminfo ".s:ProjectDir."/project.viminfo"
    call s:Loadtags(1, 1)
endfunction

"session
nmap <leader>ss :call SaveSession()<cr>
" nmap <leader>ss :set sessionoptions-=curdir<cr>:set sessionoptions+=sesdir<cr>:mksession! eval(s:ProjectDir)."/project.vim"<cr>:wviminfo! eval(s:ProjectDir)."project.viminfo"<cr>
"nmap <silent> <leader>ls :source project.vim<cr>:rviminfo project.viminfo<cr>:cs add cscope.out<cr>:set tags=tags<cr>:let g:LookupFile_TagExpr = '"./filenametags"'<cr>:source $VIMRUNTIME/../vimfiles/plugin/mark.vim<cr>
"nmap <leader>ls :source project.vim<cr>:rviminfo project.viminfo<cr>:cs add cscope.out<cr>:set tags=tags<cr>:let g:LookupFile_TagExpr = '"./filenametags"'<cr>:source $HOME/.vim/bundle/mark/plugin/mark.vim<cr>
nmap <leader>ls :call LoadSession()<cr>

"nmap <leader>sp :set paste<cr>
"nmap <leader>np :set nopaste<cr>

if has("win32")
    map <silent> <leader>s :source $HOME/_vimrc<cr>
    map <silent> <leader>e :e $HOME/_vimrc<cr>
else
    "Fast reloading of the _vimrc
    map <silent> <leader>s :source $HOME/.vimrc<cr>
    "Fast editing of _vimrc
    map <silent> <leader>e :e $HOME/.vimrc<cr>
endif

if has("win32")
    autocmd! bufwritepost .vimrc source $HOME/_vimrc
else
    "When vimrc is edited, reload it
    autocmd! bufwritepost .vimrc source $HOME/.vimrc
endif

map <C-n> :cn<CR>
map <C-p> :cp<CR>

map <leader>bd :Bclose<cr>
"map <leader>bd :bd<cr>
vnoremap <leader>y "+y
nmap <leader>yw "+yw
nmap <leader>p "+p

"yankring
"nnoremap <silent> <leader>ys :YRShow<CR>
"
function! UpdateDateTags()

    if filereadable(s:ProjectDir."/tags")
        " exec ":silent !ctags -L ".s:ProjectDir."/cscope.files -f ".s:ProjectDir."/tags"
        exec ":silent !ctags -L ".s:ProjectDir."/cscope.files -f ".s:ProjectDir."/tags"
    exec ":silent !ctags --c++-kinds=+p --fields=+iaS --extra=+q -L ".s:ProjectDir."/cscope.files -f ".s:ProjectDir."/tags"
        exec ":redraw!"
    endif

    if filereadable(s:ProjectDir."/GTAGS")
        echomsg "update gtags"
        exec ":silent !gtags -f ".s:ProjectDir."/cscope.files -i ".s:ProjectDir
        exec ':silent cs reset'
        exec ":redraw!"
    elseif filereadable(s:ProjectDir."/cscope.out")
        echomsg "update cscope"
        exec ":silent !mv ".s:ProjectDir."/cscope.* ./"
        exec ":silent !cscope -bkq -i cscope.files"
        echomsg "!mv cscope.* ".s:ProjectDir
        exec ":redraw!"
        exec ":silent !mv cscope.* ".s:ProjectDir
        exec ':silent cs reset'
        exec ":redraw!"
    endif
endfunction

nmap <F9> :call UpdateDateTags()<CR>
"nmap <F9> :!cscope -bkq -i cscope.files -f cscope.out<CR>:cs reset<CR>
"nmap <F9> :!gtags -f cscope.files -i<CR>:cs reset<CR>

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")
    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

"Mark
nmap <Leader>M <Plug>MarkToggle 
nmap <Leader><SPACE> <Plug>MarkAllClear

""""""""""""""""""""""""""""""
" markbrowser setting
""""""""""""""""""""""""""""""
"nmap <silent> <leader>mk :MarksBrowser<cr>
"
""""""""""""""""""""""""""""""
" showmarks setting
""""""""""""""""""""""""""""""
" Enable ShowMarks
let showmarks_enable = 1
" Show which marks
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
" Ignore help, quickfix, non-modifiable buffers
let showmarks_ignore_type = "hqm"
" Hilight lower & upper marks
let showmarks_hlline_lower = 1
let showmarks_hlline_upper = 1


let g:LookupFile_DisableDefaultMap = 1


"""NeoComplete
""" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" AutoComplPop like behavior.
let g:neocomplcache_enable_auto_select = 1

" When you input 'ho-a',neocomplcache will select candidate 'a'.
let g:neocomplcache_enable_quick_match = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
           \ 'default' : '',
           \ }

if !exists('g:neocomplcache_same_filetype_lists')
    let g:neocomplcache_same_filetype_lists = {}
endif
" In c buffers, completes from cpp and d buffers.
let g:neocomplcache_same_filetype_lists.c = 'cpp,d'
" In cpp buffers, completes from c buffers.
let g:neocomplcache_same_filetype_lists.cpp = 'c'
" In gitconfig buffers, completes from all buffers.
let g:neocomplcache_same_filetype_lists.gitconfig = '_'
" In default, completes from all buffers.
let g:neocomplcache_same_filetype_lists._ = '_'

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><C-e>  neocomplcache#smart_close_popup()
" <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
" inoremap <expr><SPACE>  pumvisible() ? neocomplcache#cancel_popup()."\<SPACE>" : "\<SPACE>"
inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "\<CR>"
" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
"let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
"if has("autocmd")
"    autocmd InsertEnter * NeoComplCacheCachingBuffer
"    autocmd InsertLeave * NeoComplCacheCachingBuffer
"endif

let g:neocomplcache_force_overwrite_completefunc=1
let g:clang_complete_auto=0 "don't auto do clang_complete

let g:clang_hl_errors = 0
if !filereadable(s:ProjectDir."/project-setting.vim") "工程配置文件的名字
    let g:clang_use_library = 1 "applications
endif
let g:clang_library_path = '/usr/local/lib'
let g:clang_complete_copen = 1 
let g:clang_complete_macros = 1
let g:clang_complete_patterns = 1
let g:clang_sort_algo = ''
let g:clang_auto_select = 1
let g:clang_auto_user_options = '.clang_complete'
nmap <silent> <leader>Q :call g:ClangUpdateQuickFix()<cr>
nmap <silent> <leader>C :let g:clang_complete_auto=!g:clang_complete_auto<cr>

augroup filetypedetect
    au BufNewFile,BufRead *.bld setf javascript
augroup END

augroup filetypedetect
    au BufNewFile,BufRead *.make setf make
augroup END
"let g:clang_user_options = '|| exit 0"'
"if has("win32")
    "let g:clang_user_options = '2> NUL || exit 0"'
"else
    "let g:clang_user_options = '2> /dev/null || exit 0"'
"endif

" let g:NERDCompactSexyComs = 1
let g:NERDSpaceDelims = 1

let g:rainbow_active = 1 
" rainbow_parentheses
"au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces
map <unique> <Leader>fa <Plug>AM_afnc
map <unique> <Leader>dc <Plug>AM_adec
map <unique> <Leader>df <Plug>AM_adef
