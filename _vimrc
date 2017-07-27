source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set nocompatible  " 关闭vi兼容

set shortmess=atI " 启动时不显示援助乌干达儿童的提示
set number
set ruler      " 显示标尺
syntax enable  " 语法高亮
set cursorline " 高亮光标所在行
colorscheme desert
set guifont=consolas:h12            " 控制字体系列&字号
set guifontwide=YouYuan:h12:cGB2312 " 控制字体系列&字号
winpos 0 0                          " 窗口初始位置及大小
set lines=52 columns=99             " 窗口大小
set cmdheight=1 " 命令行(在状态行下)的高度,默认为1

"** 若需要使用YCM，这句必须要有，勿误删！勿误删！！！
set encoding=utf-8 " 设置当前字符编码为 UTF-8. ** 若需要使用YCM，这句必须要有，勿误删！勿误删！！！
set fileencodings=ucs-bom,utf-8,chinese,latin-1,gbk,cp936,big5,gb2312,euc-jp,euc-kr " 设置编码的自动识别
set fileencoding=utf-8
set nobomb " 去掉BOM标记
source $VIMRUNTIME/delmenu.vim " 解决consle输出乱码
source $VIMRUNTIME/menu.vim    " 解决consle输出乱码
language messages zh_CN.utf-8  " 解决菜单乱码.使用中文提示信息, 并使用 UTF-8 编码.

set ambiwidth=double
set writebackup        " 保存文件前建立备份,保存成功后删除该备份
set nobackup           " 不生成备份文件
set noswapfile         " 关闭交换文件
set history=500        " 历史记录数
set undodir=~/.undodir " undofile统一写入~/.undodir里面,不会四处分散了

filetype on                " 启用文件类型侦测
filetype plugin on         " 针对不同的文件类型加载对应的插件
filetype plugin indent on  " 开启文件类型自动识别, 启用文件类型插件, 启用针对文件类型的自动缩进.
set foldmethod=syntax      " 自动语法折叠, "manual"为手动折叠
set shiftwidth=4  " 自动缩进的时候, 缩进尺寸为4个空格.
set tabstop=4     " Tab宽度为4个字符.
set expandtab     " 编辑时将所有 Tab 替换为空格.
set smarttab      " 当使用 et 将 Tab 替换为空格之后, 按下一个 Tab 就能插入 4 个空格, 但要想删除这 4 个空格, 就得按 4 下 Backspace. 设置 smarttab 之后, 就可以只按一下 Backspace 就删 4 个空格了.
"set spell        " 打开拼写检查. 拼写有错的单词下方会有红色波浪线, 将光标放在单词上, 按 z= 就会出现拼写建议, 按 ]s 可以直接跳到下一个拼写错误处.
set showmatch     " 高亮显示匹配的括号
set matchtime=5   " 匹配括号高亮的时间(单位:0.1s)

" **** vundle 配置文件 ***
filetype off
set rtp+=$VIMRUNTIME/bundle/Vundle.vim/  " 此处规定Vundle的路径。可以在vim中输入“:echo $VIMRUNTIME”查看$VIMRUNTIME指代的路径
call vundle#begin('$VIMRUNTIME/bundle/')
Plugin 'VundleVim/Vundle.vim'            " vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
Plugin 'Valloric/YouCompleteMe'          " vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
Plugin 'scrooloose/nerdtree'             " vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#end()       " 插件列表结束
filetype on

" *** YouCompleteMe 配置文件 ***
set completeopt=longest,menu    " 让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
let g:ycm_global_ycm_extra_conf='C:/Program Files (x86)/Vim/vim80/bundle/YouCompleteMe/.ycm_extra_conf.py' " 编译完成之后我把C:/Program Files (x86)/Vim/vim80/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/目录下的.ycm_extra_conf.py复制到了C:/Program Files (x86)/Vim/vim80/bundle/YouCompleteMe。
"let g:ycm_global_ycm_extra_conf='$VIMRUNTIME/bundle/YouCompleteMe/.ycm_extra_conf.py' " 用这样的表达似乎会报错：NoExtraConfDetected: No .ycm_extra_conf.py file detected, so no compile
"let g:ycm_global_ycm_extra_conf='$VIMRUNTIME/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py' " 同上，报错

let g:ycm_confirm_extra_conf=0                            " 关闭加载.ycm_extra_conf.py提示
let g:ycm_cache_omnifunc=0                                " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_min_num_of_chars_for_completion=2               " 从第2个键入字符就开始罗列匹配项
let g:ycm_collect_identifiers_from_tags_files=1           " 开启 YCM 基于标签引擎
let g:ycm_seed_identifiers_with_syntax=1                  " 语法关键字补全
let g:ycm_complete_in_comments=1                          " 在注释输入中也能补全
let g:ycm_complete_in_strings=1                           " 在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings=1 " 注释和字符串中的文字也会被收入补全

autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"  " 回车即选中当前项

" 快捷键
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>    " force recomile with syntastic
nnoremap <leader>lo :lopen<CR>     " open locationlist
nnoremap <leader>lc :lclose<CR>    " close locationlist
inoremap <leader><leader> <C-x><C-o>
nmap <leader>gd :YcmDiags<CR>
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>  " 跳转到申明处
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>   " 跳转到定义处
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处

"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"youcompleteme  默认tab  s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-n>']
"let g:ycm_key_list_select_completion=['<Down>'] " 如果不把这行注释掉，选词时手要离开主键盘按方向键。手要离开主键盘还不如自己手动把词输入完整，智障设置。绑到哪都好，不建议绑到<Down>。
"let g:ycm_key_list_previous_completion=['<c-p>']
"let g:ycm_key_list_previous_completion=['<Up>'] " 如果不把这行注释掉，选词时手要离开主键盘按方向键。手要离开主键盘还不如自己手动把词输入完整，智障设置。绑到哪都好，不建议绑到<Up>。


set diffexpr=MyDiff()
function MyDiff()
    let opt = '-a --binary '
    if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
    if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
    let arg1 = v:fname_in
    if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
    let arg2 = v:fname_new
    if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
    let arg3 = v:fname_out
    if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
    if $VIMRUNTIME =~ ' '
        if &sh =~ '\<cmd'
            if empty(&shellxquote)
                let l:shxq_sav = ''
                set shellxquote&
            endif
            let cmd = '"' . $VIMRUNTIME . '\diff"'
        else
            let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
        endif
    else
        let cmd = $VIMRUNTIME . '\diff'
    endif
    silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
    if exists('l:shxq_sav')
        let &shellxquote=l:shxq_sav
    endif
endfunction
